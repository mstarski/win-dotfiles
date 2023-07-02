#!/usr/bin/python3

import shutil
import sys
import subprocess
import json
from pyutils.os import cmd


def load_secret(secret_name, session_key):
    s = cmd(
        f"bw get notes {secret_name} --session {session_key} > ~/.secrets/{secret_name}")

    print(f'{secret_name} loaded ✅')
    return s.stdout


def main():
    print('🔑 Loading secrets from Bitwarden')
    # Check if `bw` binary is installed
    if not shutil.which('bw'):
        print('🔴 Bitwarden CLI is not installed')
        sys.exit(1)

    # Unlock Bitwarden vault
    unlock = cmd(f"bw unlock --raw")

    if unlock.returncode != 0:
        print('🚨 Bitwarden vault unlock failed')
        sys.exit(1)

    if unlock.stdout == '\n':
        exit(1)

    print('🔓 Bitwarden vault unlocked')
    bw_session_key = unlock.stdout

    print('🔃 Syncing Bitwarden vault')
    sync = cmd(f"bw sync --session {bw_session_key}", stderr=subprocess.PIPE)

    if sync.stderr.find('error') != -1:
        print('🚨 Bitwarden vault sync failed')
        sys.exit(1)

    # Create a folder ~/.secrets if not exists
    cmd(f"mkdir -p ~/.secrets")

    # Load secrets from deps.json
    with open('deps.json') as f:
        deps = json.load(f)
        secrets = deps['secrets']

    for secret in secrets:
        load_secret(secret, bw_session_key)


if __name__ == "__main__":
    main()
