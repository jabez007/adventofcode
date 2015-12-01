#!/bin/sh
set -eu

runtime_dir=$(mktemp -d /tmp/aoc-m.XXXXXX)
export gtmroutines="$runtime_dir($PWD) $gtm_dist/libgtmutil.so"
export gtmgbldir="$runtime_dir/gtm.gld"
export gtm_tmp="$runtime_dir"
export gtm_log="$runtime_dir"

create_database() {
    "$gtm_dist/mumps" -run GDE <<EOF || return
change -segment DEFAULT -file=$runtime_dir/gtm.dat
exit
EOF
    "$gtm_dist/mupip" create
}

# Keep setup messages out of routine output, but retain them when setup fails.
if ! create_database > "$runtime_dir/setup.log" 2>&1; then
    cat "$runtime_dir/setup.log" >&2
    exit 1
fi

exec "$gtm_dist/mumps" "$@"
