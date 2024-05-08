from subprocess import DEVNULL
from colorama import Fore
from pyutils.formatting import clrStr
from pyutils.os import cmd
from os.path import isfile

def ensureExists(command, dependencies):
    source_file = '~/.zshrc' if isfile('~/.zshrc') else '~/.bashrc'

    s = cmd(
        f". {source_file} && {command}",
        check=True,
        stderr=DEVNULL,
    )

    not_detected_names = s.stdout.split('\n')[:-1]
    not_detected = [dep for dep in dependencies if dep['name'] in not_detected_names]

    if len(not_detected) == 0:
        return "[mstarski/win-config] Healthcheck passed 🎉"

    message = "[mstarski/win-config] Healthcheck failed 🚑\n"

    for dep in not_detected:
        message += f"📦 {clrStr(dep['name'], Fore.RED)} not detected\n"
        message += f"({dep['help']})\n" if 'help' in dep else ""

    message += "\nFor fully working environment install all dependencies"
    return message
