from subprocess import DEVNULL
from colorama import Fore
from pyutils.formatting import clrStr
from pyutils.os import cmd


def ensureExists(command):
    s = cmd(
        f". ~/.zshrc && {command}",
        check=True,
        stderr=DEVNULL,
    )

    not_detected = s.stdout.split('\n')[:-1]
    message = "[mstarski/win-config] Healthcheck failed 🚑\n"

    for dep in not_detected:
        message += f"📦 {clrStr(dep, Fore.RED)} not detected\n"

    message += "For fully working environment install all dependencies"
    return message
