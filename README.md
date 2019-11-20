# Process Store

A simple library to store and retrieve data from the process tree.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `process_store` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:process_store, git: "https://github.com/FindHotel/bofh-process-store.git", ref: "0.1.0"}
  ]
end
```

## Dependencies

  * [Elixir](https://elixir-lang.org)

## Getting Started

Install project dependencies:

```sh
$ make install
```

To build the source:

```sh
$ make build
```

To see other make tasks:

```sh
$ make
```

## Running Tests and Quality Checks

To run unit tests:

```sh
$ make test
```

To run Elixir code format:

```sh
$ make format
```

To run credo:

```sh
$ make credo
```

To run dialyzer:

```sh
$ make dialyzer
```

To run everything:

```sh
$ make full-test
```

## Generating the docs

This project uses [ex_docs](https://hex.pm/packages/ex_doc) to build its
documentation:

```sh
$ mix docs
```

## Release

After merge a new feature/bug you can bump the version and push it to upstream:

```sh
make release
git push origin master && git push origin --tags
```

## Need help?

Contact BoFH Squad engineers:

  * Antonio Lorusso ([`antonio@findhotel.net`](antonio@findhotel.net))
  * Felipe Vieira ([`felipe@findhotel.net`](felipe@findhotel.net))
  * Fernando Hamasaki de Amorim ([`fernando@findhotel.net`](fernando@findhotel.net))
