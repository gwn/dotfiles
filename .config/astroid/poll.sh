#!/bin/sh

echo $NOTMUCH_CONFIG | rev | cut -d. -f1 | rev | xargs mbsync --pull

notmuch new
