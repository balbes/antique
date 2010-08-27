#!/bin/sh
# a script to help weed duplicate packages from package lists
# Requires: libshell

. /bin/shell-quote

# _not_ useless use of cat(1)
cat "$@" \
| grep -v '^ *#' \
| sed  -s 's,[ 	]\+, ,g' \
| grep -v '^ *$' \
| sort -u \
| while read line; do
	(
		echo -n "$line: ";
		(
			pattern="`quote_sed_regexp "$line"`"
			(
				grep -l "^$pattern$" "$@" | wc -l
				grep -l "^$pattern$" "$@"
			) | tr '\n' ' '
		)
		echo
	) | grep "$pattern: [0-9]\+ [^ ]\+ [^ ]\+.*$"
done \
| sort -rn -t: -k2 \
| uniq
# sort by identical pkglist sets so that common chunks
# are more apparent; weird but sort -run won't do
