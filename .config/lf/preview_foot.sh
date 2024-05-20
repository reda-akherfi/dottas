#!/bin/sh

case "$(file -Lb --mime-type -- "$1")" in
    image/*)
        chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
        exit 1
        ;;
    *)
        preview_foot.sh "$1"
        ;;
esac
