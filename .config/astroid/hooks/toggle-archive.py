#!/usr/bin/env python2

from sys import argv
from subprocess import check_output
from os.path import dirname, basename
from os import rename
from re import sub


targetFilesRaw = check_output(
    'notmuch search --output=files thread:' + argv[1],
    shell=True
)

## Aynı dosya birden fazla folderda varsa hata verelim

targetFiles = targetFilesRaw.strip('\n').split('\n')

mailRoot = dirname(targetFiles[0]) + '/../..'

op = 'archive' if '/Inbox/' in targetFilesRaw else 'unarchive'

targetDir = 'Archive' if op == 'archive' else 'Inbox'

moveTo = mailRoot + '/' + targetDir + '/cur'


print 'targetFiles:\n' + '\n'.join(targetFiles) + '\n'
print 'mailRoot: ' + mailRoot
print 'op: ' + op
print 'targetDir: ' + targetDir
print 'moveTo: ' + str(moveTo)


for f in targetFiles:
    targetNameUIDStripped = sub(',U=\d+', '', basename(f))

    print('mv ' + f + ' ' + moveTo + '/' + targetNameUIDStripped)

    # rename(f, moveTo + '/' + targetNameUIDStripped)


# print check_output('notmuch new', shell=True)
