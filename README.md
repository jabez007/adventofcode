# adventofcode-2015

Using [M](https://en.wikipedia.org/wiki/MUMPS) for [2015's Advent of Code](https://adventofcode.com/2015).

Run routines in Docker with GT.M V6.2-002A, available in June 2015.
See the [GT.M release notes](https://fis-gtm.sourceforge.io/releasenotes/GTM_V6.2-002_Release_Notes.html).
The Dockerfile pins the runtime archive by SHA-256 and the Ubuntu base image by digest.
The base is [Ubuntu 14.04 LTS](https://lists.ubuntu.com/archives/ubuntu-announce/2014-April/000182.html), released April 17, 2014.
The published base image includes later Trusty maintenance updates. GT.M itself is pinned to the 2015 release.
The container uses M character mode for byte-oriented puzzle input.

## Run a routine

Install Docker Engine or Docker Desktop with the Compose plugin, then run these commands from the repository root:

```sh
docker compose build
docker compose run --rm m -run main
```

The starter in `day01/main.m` prints the runtime version and `Advent of Code 2015 - Day 01`.
Replace it with your solution. GT.M compiles routines when you run them.

To pass puzzle input through standard input, use:

```sh
docker compose run --rm -T m -run main < day01/input.txt
```

The starter does not read input yet. Add a `read` command to your solution before using this form.

Keep each day's routines and input files in its own directory.
After adding `day02/main.m`, run that day with:

```sh
docker compose run --rm --workdir /work/day02 m -run main
```

The working directory also controls relative file paths opened by your routines.

## Open an interactive prompt

```sh
docker compose run --rm m
```

At the `GTM>` prompt, enter:

```text
write $zversion,!
do ^main
halt
```

## Container files

Compose mounts this checkout read-only at `/work` and starts in `/work/day01`.
Source edits on the host are available on the next run without rebuilding the image.
The image runs as a non-root user and needs no host M installation.

Each container initializes its own temporary database for M globals.
Compiled objects and database files stay inside the container and disappear when you remove it with `--rm`.
Containers do not share globals. Keep puzzle inputs in files in your checkout.
To save answers, redirect standard output to a host file with `docker compose run --rm -T m -run main > day01/output.txt`.
The runtime container has no network access.

The image uses the historical Linux x86-64 runtime, so Compose selects `linux/amd64`.
Other host architectures require Docker's support for that platform.

If an existing Linux login session lacks your configured Docker group, refresh the session or run commands through `sg`:

```sh
sg docker -c 'docker compose build'
sg docker -c 'docker compose run --rm m -run main'
```
