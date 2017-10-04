defmodule Stack do
  def loop(stack) do
    receive do
      {:pop, caller} ->
        [h|t] = stack
        send caller, h
        loop(t)
      {:push, value} ->
        loop([value | stack])
    end
    loop(stack)
  end

  def run do
    spawn_link(Stack, :loop, [[greet: "Hello"]])
  end

  def pop(pid) do
    send(pid, {:pop, self()})
  end

  def push(pid, value) do
    send(pid, {:push, value})
  end
end
