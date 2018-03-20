defmodule Spin do
  def start do
    spawn(fn -> loop(0) end)
  end

  def loop(uptime) do
    receive do
      :stop ->
        IO.puts "Shutting down ..."
       exit(:normal)
    after 2_000 ->
      IO.puts "*******Spinning #{uptime} times on #{node()} !!!"
    end
    Spin.loop(uptime + 1)
  end
end
