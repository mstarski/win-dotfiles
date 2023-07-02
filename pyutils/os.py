import subprocess


def cmd(command, **kwargs):
    return subprocess.run(
        command,
        shell=True,
        executable='/bin/zsh',
        encoding='utf-8',
        stdout=subprocess.PIPE,
        **kwargs)
