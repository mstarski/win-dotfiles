import subprocess
import os.path

def hasZsh():
    return os.path.isfile('/bin/zsh')

def cmd(command, **kwargs):
    return subprocess.run(
        command,
        shell=True,
        executable='/bin/zsh',
        encoding='utf-8',
        stdout=subprocess.PIPE,
        **kwargs)
