# adventofcode-2024

Using [Go](https://go.dev/) for [2024's Advent of Code](https://adventofcode.com/2024).

Use Go 1.23.4, the last stable Go release available by December 31, 2024.
See the [Go release history](https://go.dev/doc/devel/release#go1.23.0).
The version is recorded in `go.mod` and `.go-version`.

With Go 1.21 or newer installed, select the exact historical toolchain for each command:

```sh
GOTOOLCHAIN=go1.23.4 go version
GOTOOLCHAIN=go1.23.4 go run ./day01
GOTOOLCHAIN=go1.23.4 go test ./...
GOTOOLCHAIN=go1.23.4 go vet ./...
```

Go downloads the toolchain on first use. `go version` must report `go1.23.4`.
Alternatively, install Go 1.23.4 with a version manager that reads `.go-version`.
The `go` directive in `go.mod` sets a minimum version, so use the commands above to avoid a newer compiler.

The starter prints `Advent of Code 2024 - Day 01`. Replace it with your solution.
Keep each day's program in its own directory, such as `day01/main.go`.
Format Go files with `gofmt`.
