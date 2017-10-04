defmodule ElixirBasics do
  # module attribute
  @greeting "Hello"

  IO.puts "expressions can be executed when module loads"

  def greeting(name) do
    "Hello #{name}."
  end

  def greeting1(name) do
    ~s(#{@greeting} #{name}.)
  end

  # atoms
  # iex(1)> ok = :ok
  # :ok

  #tuple
  # iex(4)> tuple = {:ok, "meaning of life", 42}
  # {:ok, "meaning of life", 42}
  # iex(5)> {:ok, found, value} = tuple
  # {:ok, "meaning of life", 42}
  # iex(6)> found
  # "meaning of life"
  # iex(7)> value
  # 42

  #list
  # iex(9)> list = [:ok, "meaning of life", 42]
  # [:ok, "meaning of life", 42]
  # iex(12)> length list
  # 3
  # iex(15)> [ok| rest] = list
  # [:ok, "meaning of life", 42]
  # iex(17)> ok
  # :ok
  # iex(18)> rest
  # ["meaning of life", 42]

  #maps
  # iex(21)> map = %{"ok" => 42, 33 => 55}
  # %{33 => 55, "ok" => 42}
  # iex(22)> map[33]
  # 55
  # iex(23)> map[ok]
  # nil
  # iex(24)> map["ok"]
  # 42
  # iex(25)> %{ map | :greet => "hello"}
  # ** (KeyError) key :greet not found in: %{33 => 55, "ok" => 42}
  # (stdlib) :maps.update(:greet, "hello", %{33 => 55, "ok" => 42})
  # (stdlib) erl_eval.erl:255: anonymous fn/2 in :erl_eval.expr/5
  #     (stdlib) lists.erl:1263: :lists.foldl/3

  # iex(27)> Map.put(map, :greet, "hello")
  # %{33 => 55, :greet => "hello", "ok" => 42}
  # iex(28)> map.greet
  # ** (KeyError) key :greet not found in: %{33 => 55, "ok" => 42}

  # iex(28)> map = Map.put(map, :greet, "hello")
  # %{33 => 55, :greet => "hello", "ok" => 42}
  # iex(29)> map.greet
  # "hello"
  # iex(31)> %{ map | :greet => "hello IT Camp"}
  # %{33 => 55, :greet => "hello IT Camp", "ok" => 42}

end
