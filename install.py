#!/usr/bin/env python3
import os
import sys
import time
import threading
import shutil
import subprocess
from pathlib import Path
from datetime import datetime

# ANSI Colors
RESET = "\033[0m"
BOLD = "\033[1m"
DIM = "\033[2m"
GREEN = "\033[32m"
BLUE = "\033[34m"
CYAN = "\033[36m"
YELLOW = "\033[33m"
RED = "\033[31m"
MAGENTA = "\033[35m"

class Spinner:
    def __init__(self, message="Loading..."):
        self.spinner_chars = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏']
        self.message = message
        self.running = False
        self.thread = None

    def spin(self):
        i = 0
        while self.running:
            sys.stdout.write(f"\r{CYAN}{self.spinner_chars[i % len(self.spinner_chars)]}{RESET} {self.message}")
            sys.stdout.flush()
            time.sleep(0.08)
            i += 1

    def start(self):
        self.running = True
        self.thread = threading.Thread(target=self.spin)
        self.thread.start()

    def stop(self, success=True, final_msg="Done!"):
        self.running = False
        if self.thread:
            self.thread.join()
        sys.stdout.write('\r' + ' ' * (len(self.message) + 15) + '\r') # clear line
        if final_msg:
            if success:
                print(f"{GREEN}✔{RESET} {final_msg}")
            else:
                print(f"{RED}✖{RESET} {final_msg}")

def print_header():
    ascii_art = f"""{MAGENTA}{BOLD}
╔╦╗╔═╗╔╦╗╔═╗╦╦  ╔═╗╔═╗  ╦╔╗╔╔═╗╔╦╗╔═╗╦  ╦  ╔═╗╦═╗
 ║║║ ║ ║ ╠╣ ║║  ║╣ ╚═╗  ║║║║╚═╗ ║ ╠═╣║  ║  ║╣ ╠╦╝
═╩╝╚═╝ ╩ ╚  ╩╩═╝╚═╝╚═╝  ╩╝╚╝╚═╝ ╩ ╩ ╩╩═╝╩═╝╚═╝╩╚═
{RESET}"""
    print(ascii_art)
    print(f"{BLUE}Welcome to the interactive dotfiles installer!{RESET}")

def backup_file(path: Path):
    if path.exists() or path.is_symlink():
        if path.is_symlink() and not path.exists(): # broken symlink
            path.unlink()
            return True
            
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_path = path.with_name(f"{path.name}.backup_{timestamp}")
        
        spinner = Spinner(f"Backing up {YELLOW}{path.name}{RESET}...")
        spinner.start()
        time.sleep(0.3) # for effect
        try:
            if path.is_symlink():
                path.unlink()
            elif path.is_dir():
                shutil.move(str(path), str(backup_path))
            else:
                shutil.move(str(path), str(backup_path))
            spinner.stop(success=True, final_msg=f"Backed up {path.name} to {DIM}{backup_path.name}{RESET}")
        except Exception as e:
            spinner.stop(success=False, final_msg=f"Failed to backup {path.name}: {e}")
            return False
    return True

def symlink_file(src: Path, dest: Path):
    if not src.exists():
        print(f"{RED}✖{RESET} Source not found: {DIM}{src}{RESET}")
        return

    if dest.is_symlink() and dest.exists() and str(dest.resolve()) == str(src.resolve()):
        print(f"{GREEN}✔{RESET} Already linked: {CYAN}{src.name}{RESET} -> {DIM}{dest}{RESET}")
        return

    if dest.exists() or dest.is_symlink():
        if not backup_file(dest):
            return

    spinner = Spinner(f"Linking {CYAN}{src.name}{RESET} -> {DIM}{dest}{RESET}...")
    spinner.start()
    time.sleep(0.2) # for effect

    try:
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.symlink_to(src)
        spinner.stop(success=True, final_msg=f"Linked {CYAN}{src.name}{RESET} -> {DIM}{dest}{RESET}")
    except Exception as e:
        spinner.stop(success=False, final_msg=f"Failed to link {src.name}: {e}")

CATEGORIES = {
    "Desktop Environment (Hyprland, Waybar, Mako, Rofi, Quickshell)": [
        ".config/hypr",
        ".config/waybar",
        ".config/mako",
        ".config/rofi",
        ".config/quickshell"
    ],
    "Terminal & Shell (Kitty, Fish, Tmux, Fastfetch, Yazi)": [
        ".config/kitty",
        ".config/fish",
        ".config/fastfetch",
        ".config/yazi",
        ".tmux.conf",
        ".tmux"
    ],
    "Editors (Vim)": [
        ".vimrc",
        ".vim"
    ]
}

PACKAGE_CATEGORIES = {
    "my fav cli util": [
        "yay -S neo-matrix pipes.sh --needed --noconfirm",
        "sudo pacman -S btop --noconfirm --noprogressbar"
    ]
}

def ask_user():
    print(f"\n{BOLD}Select components to install:{RESET}")
    print(f"{DIM}Type numbers separated by spaces (e.g., '1 2'), 'a' for all, or 'q' to quit.{RESET}\n")
    
    options = []
    print(f"{BOLD}Dotfiles:{RESET}")
    for cat in CATEGORIES:
        options.append(('dotfiles', cat))
        print(f"  {CYAN}[{len(options)}]{RESET} {cat}")
        
    print(f"\n{BOLD}Packages:{RESET}")
    for cat in PACKAGE_CATEGORIES:
        options.append(('packages', cat))
        print(f"  {CYAN}[{len(options)}]{RESET} {cat}")
    
    print(f"\n  {CYAN}[a]{RESET} All of the above")
    print(f"  {CYAN}[q]{RESET} Quit")
    
    while True:
        try:
            choice = input(f"\n{BOLD}Your choice > {RESET}").strip().lower()
            if choice == 'q':
                print(f"\n{RED}Installation cancelled.{RESET}")
                sys.exit(0)
            if choice in ('a', 'all'):
                return options
                
            selected = []
            for part in choice.split():
                idx = int(part) - 1
                if 0 <= idx < len(options):
                    if options[idx] not in selected:
                        selected.append(options[idx])
                else:
                    raise ValueError
                    
            if selected:
                return selected
            print(f"{RED}Please select at least one valid option.{RESET}")
        except ValueError:
            print(f"{RED}Invalid input. Please enter numbers separated by spaces.{RESET}")
        except KeyboardInterrupt:
            print(f"\n{RED}Installation cancelled.{RESET}")
            sys.exit(1)

def install_fonts(dotfiles_dir: Path, home_dir: Path):
    font_zip = dotfiles_dir / "fonts" / "JetBrainsMono.zip"
    if not font_zip.exists():
        return
        
    fonts_dir = home_dir / ".local" / "share" / "fonts"
    jb_dir = fonts_dir / "JetBrainsMono"
    
    print(f"{MAGENTA}{BOLD}>>> Installing JetBrainsMono Nerd Font{RESET}")
    spinner = Spinner(f"Extracting {CYAN}JetBrainsMono.zip{RESET} to {DIM}{jb_dir}{RESET}...")
    spinner.start()
    time.sleep(0.2)
    
    try:
        jb_dir.mkdir(parents=True, exist_ok=True)
        shutil.unpack_archive(str(font_zip), str(jb_dir), "zip")
        subprocess.run(["fc-cache", "-f"], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        spinner.stop(success=True, final_msg=f"Installed fonts to {DIM}{jb_dir}{RESET} and updated font cache")
    except Exception as e:
        spinner.stop(success=False, final_msg=f"Failed to install fonts: {e}")
    print()

def main():
    if os.geteuid() == 0:
        print(f"{RED}{BOLD}✖ Error: Do not run this script as root or with sudo.{RESET}")
        print(f"{DIM}Please run it as your normal user. The script will request sudo later if needed.{RESET}")
        sys.exit(1)

    print_header()
    
    selected_options = ask_user()
    if not selected_options:
        return
        
    print(f"\n{BOLD}Starting installation...{RESET}\n")
    
    dotfiles_dir = Path(__file__).parent.resolve()
    # Always resolve the true user home directory even if running under sudo (though blocked above)
    home_dir = Path(os.path.expanduser('~'))
    
    install_fonts(dotfiles_dir, home_dir)
    
    for opt_type, cat in selected_options:
        if opt_type == 'dotfiles':
            print(f"{MAGENTA}{BOLD}>>> Installing {cat}{RESET}")
            paths = CATEGORIES[cat]
            for rel_path in paths:
                if rel_path.startswith(".config/"):
                    src_name = rel_path[8:]
                    src = dotfiles_dir / "config" / src_name
                else:
                    src = dotfiles_dir / "config" / rel_path
                
                dest = home_dir / rel_path
                
                if src.exists():
                    symlink_file(src, dest)
                else:
                    print(f"{DIM}Skipping {rel_path} (not found in source){RESET}")
            print()
        elif opt_type == 'packages':
            print(f"{MAGENTA}{BOLD}>>> Installing packages: {cat}{RESET}")
            cmds = PACKAGE_CATEGORIES[cat]
            for cmd in cmds:
                print(f"{DIM}Running: {cmd}{RESET}")
                try:
                    subprocess.run(cmd, shell=True, check=True)
                except subprocess.CalledProcessError:
                    print(f"{RED}✖ Failed to run: {cmd}{RESET}")
            print()
                
    print(f"{GREEN}{BOLD}🎉 Installation Complete! Enjoy your new setup!{RESET}")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n{RED}Installation cancelled by user.{RESET}")
        sys.exit(1)
