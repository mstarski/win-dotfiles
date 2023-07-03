from colorama import Style


def clrStr(string, color):
    return color + string + Style.RESET_ALL


def printFrame(text):
    lines = text.split('\n')
    maxLen = max([len(l) for l in lines])
    print('┌' + '─' * (maxLen + 2) + '┐')

    print(
        '│' + lines[0].center(maxLen + 1) + '│')

    for l in lines[1:-1]:
        print('│ ' + l.ljust(maxLen + 8) + ' │')

    if len(lines) > 1:
        print('│ ' + lines[-1].ljust(
            maxLen) + ' │')

    print('└' + '─' * (maxLen + 2) + '┘')
