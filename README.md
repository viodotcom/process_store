# Process Store

[![Hex.pm](https://img.shields.io/hexpm/v/process_store.svg)](https://hex.pm/packages/process_store)
[![Docs](https://img.shields.io/badge/hex-docs-542581.svg)](https://hexdocs.pm/process_store)
[![Build Status](https://travis-ci.com/FindHotel/process_store.svg?branch=master)](https://travis-ci.com/FindHotel/process_store)
[![License](https://img.shields.io/hexpm/l/process_store.svg)](https://github.com/FindHotel/process_store/blob/master/LICENSE)

A simple library to store and retrieve data from the process tree.

## Installation

The package is [available in Hex](https://hex.pm/packages/process_store), and can be installed by
adding `process_store` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:process_store, "~> 0.1.0"}
  ]
end
```

## Usage

Store a value:
```elixir
iex> ProcessStore.store(:my_key, "my value")
nil

# When a key already exists, store the new value and return the previous one.
iex> ProcessStore.store(:my_key, "a new value")
"my value"
```

Fetch a value:
```elixir
iex> ProcessStore.fetch(:my_key)
"a new value"

iex> ProcessStore.store(:non_existing_key)
nil
```

The stored values are available in different processes:
```elixir
iex> ProcessStore.store(:my_key, "my value")
nil

iex> task = Task.async(fn -> ProcessStore.fetch(:my_key) end)
%Task{
  owner: #PID<0.184.0>,
  pid: #PID<0.208.0>,
  ref: #Reference<0.1292195905.2439512066.24239>
}

iex> Task.await(task)
"my value"
```

## Full documentation

The full documentation is available at [https://hexdocs.pm/process_store](https://hexdocs.pm/process_store).

## Development

Helpful make commands are available for development, like to install dependencies and run tests.

To list all the make commands:
```sh
make
```

### Release

After merge a new feature/bug you can bump and publish it with:

```sh
make release
make publish
```

## Contributing

See the [contributing guide](https://github.com/FindHotel/process_store/blob/master/CONTRIBUTING.md).

## License

Process Store is released under the Apache 2.0 License. See the
[LICENSE](https://github.com/FindHotel/process_store/blob/master/LICENSE) file.

## Author

[FindHotel](https://github.com/FindHotel)

![FindHotel](https://dgivdslhqe3qo.cloudfront.net/careers/photos/10047/thumb_photo_1463900217.png)
