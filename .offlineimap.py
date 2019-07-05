import subprocess

def getpass(value, line=1):
    passwd = subprocess.check_output(['pass', value])
    return passwd.splitlines()[line - 1]
