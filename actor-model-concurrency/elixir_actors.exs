defmodule Talker do
  def loop do
    receive do
      {:greet, name, sender} -> IO.puts("Hello #{name} from #{inspect sender}")
      {:praise, name} -> IO.puts("#{name}, you're amazing")
      {:celebrate, name, age} -> IO.puts("Here's to another #{age} years, #{name}")
      {:shutdown} -> exit(:normal)
    end
    loop
  end
end

defmodule KeyValueStore do
  def loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

# talker = spawn(&Talker.loop/0)
# send(talker, {:greet, "Hey", self()})
# send(talker, {:praise, "Dewey"})
# send(talker, {:celebrate, "Louie", 16})
# send(talker, {:shutdown})
# IO.puts("Process still alive? #{inspect Process.alive?(talker)}")

# iex(3)> kv = spawn(KeyValueStore, :loop, [%{greet: "Hello"}])
# #PID<0.96.0>
# iex(4)> send(kv, {:get, :greet, self()})
# {:get, :greet, #PID<0.88.0>}
#  flush
