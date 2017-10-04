defmodule Talker do
  def loop do
    receive do
      {:greet, name, sender} -> IO.puts("Hello #{name} from #{inspect sender}")
      {:praise, name} -> IO.puts("#{name}, you're amazing")
      {:celebrate, name, age} -> IO.puts("Here's to another #{age} years, #{name}")
      {:kaboom} -> exit(:kaboom)
      {:shutdown} -> exit(:normal)
    end
    loop()
  end

  def run do
    spawn(&Talker.loop/0)
  end
  def run_linked do
    spawn_link(&Talker.loop/0)
  end

  def trapped_exit do
    # system process
    Process.flag(:trap_exit, true)
    talker = run_linked
    send talker, {:kaboom}

    receive do
      {:EXIT, from_pid, reason} -> IO.puts "Exit reason: #{inspect from_pid} #{reason}"
    after
      1_000 -> "nothing after 1s"
    end

    # suicide
    #Process.exit(self(), :kill)
  end

  def greet(pid, message) do
    send(pid, {:greet, message, self()})
  end

end
