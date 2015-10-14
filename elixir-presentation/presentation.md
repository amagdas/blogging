# Who am I?

# Purpose of the talk:
* Why Erlang(VM) - OTP anyone?
* Why Elixir
* Why Phoenix

# Why Erlang
Functional, dynamic, distributed, OTP, did I mention agents?

# Why Elixir - *it's not about the syntax*

## Erlang core facilities: Data(types), Modules(hot), Processes
- the support for Data is the weakest one:
   - records are compile time
   - maps are runtime, no "tagging"

## Elixir to the rescue

### Extensibility - *provide data type polymorphism*
- erlang processes and modules are polymorphic
- define protocols
- builtin ones:
    - Enumerable(lists, files, etc)
    - Stream
    - Inspect

### Productivity
Mix + Hex + Docs
The power of OTP

### Compatibility
Fully compatible with erlang, no cost in calling erlang code from elixir or the other way around.
*GenServer* - awesome abstraction for keeping state and computation

####We can do better than that:
*Tasks* - computation
    From C# -> *Task.async*, *Task.await*
*Agent* - state

# Why Phoenix
## Productive, Reliable, Fast

### Fast - isolated and concurrent, no global GC
https://github.com/mroth/phoenix-showdown/blob/master/RESULTS_v2.md

### Productive
- good documentation
- generators `mix phoenix.gen.json`
- Ecto
- form builders
- static build tools with ES6 as default
- pretty error pages
- packaging

### Reliable

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


# Next steps
http://elixir-lang.org/
https://pragprog.com/book/elixir/programming-elixir
http://www.phoenixframework.org/

# Recap/conclusions