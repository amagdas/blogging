defmodule Talker do
  def loop do
    receive do
      {:greet, name, sender} -> IO.puts("Hello #{name} from #{inspect sender}")
      {:praise, name} -> IO.puts("#{name}, you're amazing")
      {:celebrate, name, age} -> IO.puts("Here's to another #{age} years, #{name}")
      {:kaboom} -> exit(:kaboom)
      {:shutdown} -> exit(:normal)
    end
    loop
  end

  def run do
    spawn(&Talker.loop/0)
    # spawn_link(&Talker.loop/0)
  end

  def trapped_exit do
    Process.flag(:trap_exit, true)
    spawn_link(&Talker.loop/0)

    receive do
      {:EXIT, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
    end
  end

  def greet(pid, message) do
    send(pid, {:greet, message, self()})
  end

end

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
    spawn(Stack, :loop, [[greet: "Hello"]])
  end

  def pop(pid) do
    send(pid, {:pop, self()})
  end

  def push(pid, value) do
    send(pid, {:push, value})
  end

end
