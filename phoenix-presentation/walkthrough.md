# Who am I and why speak to you :)
Co-founder and lead developer at [Crafting Software](www.craftingsoftware.com), passionate about functional programming for the last 6-8 years,
interested in Erlang and Elixir for the last 2-3 years.

#Purpose of the talk
- quick intro to Elixir if needed
- quick intro to Phoenix
- dive into code examples

# Quick intro to Elixir
Functional dynamic language that runs on top of BEAM(Erlang VM)

## Types
Tuple:
```elixir
{:ok, "my result"}
```

Lists:
```elixir
[:ok, 1, "string values"]
```

Keywork lists:
```elixir
list = [{:a, 1}, {:b, "some param"}]
list = [a: 1, b: "some param"]
```

Maps:
```elixir
map = %{:key => "value"}
map = %{key: "value", another_key: "another value"}
%{key: my_value} = map
```

Structs:
```elixir
defmodule User do
  defstruct name: "John", age: 27
end
```

## Data polymorphism through protocols
```elixir
defprotocol Blank do
  @doc "Returns true if data is considered blank/empty"
  @fallback_to_any true
  def blank?(data)
end

# Integers are never blank
defimpl Blank, for: Integer do
  def blank?(_), do: false
end

# Just empty list is blank
defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_),  do: false
end

defimpl Blank, for: Any do
  def blank?(_), do: false
end

defmodule DeriveUser do
  @derive Blank
  defstruct name: "john", age: 27
end
```

- Protocol consolidation happens automatically since Elixir 1.2

# Quick intro to Phoenix - Productive, Reliable, Fast

## Productive
- good documentation
- generators `mix phoenix.gen.json`
- Ecto
- form builders
- static build tools with ES6 as default
- pretty error pages
- packaging
`:observer.start()`

### Reliable
- Supervisors
- Supervision trees

## Channels

### Transport
`socket.connect()`
Maintains the connection

### Channels
`socket.join(channel)`
They are isolated and concurrent hence fault tolerant.

### PubSub
- Distributed Erlang
- Redis
- Other

# Demo time!
- real world app
- phoenix chat example app

#Wrapping up
- [Elixir](http://www.elixir-lang.org)
- [Channels](http://www.phoenixframework.org/docs/channels)