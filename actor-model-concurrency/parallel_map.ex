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
end

defmodule Double do
  def slow(x) do
    :timer.sleep(1000)
    x * 2
  end

  def run(col) do
    :timer.tc(fn() -> Enum.map([1, 2, 3, 4], &Double.slow/1) end)
  end

  def run_parallel(col) do
    :timer.tc(fn() -> Parallel.map([1, 2, 3, 4], &Double.slow/1) end)
  end

end
