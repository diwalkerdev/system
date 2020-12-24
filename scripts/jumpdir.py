import configparser
import argparse
import os
import sys
from pathlib import Path

# IMPORTANT NOTE: It is not possible to change the directory of the parent shell directly from a Python script.
#                 Therefore, in order to get the jump command to work, this script needs to be called by a bash or shell
#                 script that reads the output and does the actual changing of directories.
#                 Using stdout to pass information back to the bash or shell script isn't ideal, as it can easily be
#                 broken by writing to std out.

# jd (no opts) - list jump directories.
# jd a         - jump to directory bound to the key entered.
# jd -s        - save current directory (prompts for binding).
# jd --help    - show help.


if os.name == "nt":
    USER_DIR = os.getenv("userprofile", None)
    assert USER_DIR, "%userprofile% environment variable does not exist"
    CONFIG_FILE = f"{USER_DIR}\\.config\\jumpdir\\jumpdir.ini"
else:
    USER_DIR = os.getenv("HOME", None)
    assert USER_DIR, "$HOME environment variable does not exist"
    CONFIG_FILE = f"{USER_DIR}/.config/jumpdir/jumpdir.ini"

CONFIG_FILE = Path(CONFIG_FILE).resolve()


def init_config_file_if_not_exists():
    CONFIG_FILE.parent.mkdir(exist_ok=True, parents=True)
    CONFIG_FILE.touch(exist_ok=True)
    assert CONFIG_FILE.exists(), f"Error: failed to initialise {str(CONFIG_FILE)}"


def show_jump_dirs(jumpdirs):
    print("Current bindings:")
    if not jumpdirs:
        print("(Empty)")
        return

    for k in jumpdirs:
        print(f" ({k}) = {jumpdirs[k]}")


def jump_to_directory(jumpdirs, key):
    path = jumpdirs.get(key, None)
    if path is None:
        sys.stderr.write(f"Not a valid binding: {key}.\n")
        return

    if not os.path.isdir(path):
        sys.stderr.write("Not a valid jump location: {path}\n")
        return

    print(f"{path}")


def add_binding(jumpdirs, key, path):
    jumpdirs[key] = path
    show_jump_dirs(jumpdirs)
    return jumpdirs


def remove_binding(jumdirs, key):
    del jumdirs[key]


def save_jump_directories(jumpdirs):
    parser = configparser.ConfigParser()
    parser["jumpdirs"] = jumpdirs

    with open(str(CONFIG_FILE), "w") as config_file:
        parser.write(config_file)


def load_config_file():
    parser = configparser.ConfigParser()

    with open(CONFIG_FILE, "r+") as config_file:
        parser.read_file(config_file)
        if "jumpdirs" not in parser.sections():
            parser["jumpdirs"] = {}

        jumpdirs = parser["jumpdirs"]
        return jumpdirs


def main():
    init_config_file_if_not_exists()
    jumpdirs = load_config_file()

    arg_parser = argparse.ArgumentParser(description="Jump to directories")
    aa = arg_parser.add_mutually_exclusive_group()
    aa.add_argument("-s", action="store_true", help="Save current directory (prompts for binding)")
    aa.add_argument("-r", action="store_true", help="Removes a binding (prompts for binding)")
    aa.add_argument("j", nargs="?", help="Jump to directory bound to the key entered")

    if len(sys.argv) <= 1:
        show_jump_dirs(jumpdirs)
        exit(0)

    args = arg_parser.parse_args()

    if args.j:
        key = args.j

        if len(key) != 1:
            sys.stderr.write(f"{key} is not a valid binding.\n")
            return

        jump_to_directory(jumpdirs, key)

    elif args.s:
        print(f"Add binding for {os.getcwd()}")
        sys.stdout.write(">> ")  # Don't want newline here.
        sys.stdout.flush()
        key = sys.stdin.read(1)

        add_binding(jumpdirs, key, os.getcwd())
        save_jump_directories(jumpdirs)

    elif args.r:
        show_jump_dirs(jumpdirs)
        print(f"Remove binding ...")
        sys.stdout.write(">> ")  # Don't want newline here.
        sys.stdout.flush()
        key = sys.stdin.read(1)

        remove_binding(jumpdirs, key)
        save_jump_directories(jumpdirs)


if __name__ == '__main__':
    main()

