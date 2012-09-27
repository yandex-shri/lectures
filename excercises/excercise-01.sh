#! /bin/sh
# Run as: sh ./excercise-01.sh /path/to/hg/repo
set -e

PATH="/usr/bin:/bin"
DEST="$HOME/.local/share/Trash/files"

init()
{
    mkdir testdir
    cd testdir
    touch file1
    touch file2
    mkdir subdir
    touch subdir/file3
    hg init
    hg add
    hg commit -m 'Added files'
    touch untracked1
    touch untracked2
    touch 'subdir/un tracked3'
    mkdir subdir/subsubdir
    touch subdir/subsubdir/untracked4
}

main()
{
    hg -R "$1" status -u -n -0 | xargs -0 -I % mv % "$DEST"
}

bonus()
{
    hg -R "$1" status -u -n -0 | while IFS="" read -r -d "" filename; do
        _dir=`dirname "$filename"`
        _destdir="$DEST/$_dir"
        mkdir -p "$_destdir"
        cp "$filename" "$_destdir"
    done
}

for i in "$@"; do
    if test -d "$i"; then
        bonus "$i"
    fi
done
