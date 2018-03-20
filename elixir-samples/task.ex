defmodule Parallel do
  def map(collection, fun) do
    parent = self()

    processes = Enum.map(collection, fn(e) ->
      spawn_link(fn() -> send(parent, {self(), fun.(e)}) end)
    end)

    Enum.map(processes, fn(pid) ->
      receive do
        {^pid, result} -> result
      end
    end)
  end

  def map_task(collection, fun) do
    collection
    |> Task.async_stream(fun)
    |> Enum.map(fn {:ok, val} -> val end)
  end
end

defmodule Double do
  def slow(x) do
    :timer.sleep(1000)
    x * 2
  end

  def run(col) do
    :timer.tc(fn() -> Enum.map(col, &Double.slow/1) end)
    |> print
  end

  def run_parallel(col) do
    :timer.tc(fn() -> Parallel.map(col, &Double.slow/1) end)
    |> print
  end

  def run_parallel_task(col) do
    :timer.tc(fn() -> Parallel.map_task(col, &Double.slow/1) end)
    |> print
  end

  defp print({ time, value }) do
    IO.puts "Took: #{div(time , 1000000)}s Result: #{inspect value}"
  end

end
