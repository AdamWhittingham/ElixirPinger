# Pinger

A little Elixir project for pinging sites; purely a learning project!


## Installing

1. `mix deps.get`


## Running

1. Launch iex with `iex -S mix`
2. Ping!

```elixir
Pinger.ping "http://elixir-lang.org"
=> {:ok, [ms: 105]}
```
