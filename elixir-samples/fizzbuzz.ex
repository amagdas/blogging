defmodule FizzBuzz do
    def play(min, max), do: Enum.each(min..max, &play/1)
    def play(num) when rem(num, 15) == 0, do: IO.puts "FizzBuzz"
    def play(num) when rem(num, 3) == 0, do: IO.puts "Fizz"
    def play(num) when rem(num, 5) == 0, do: IO.puts "Buzz"
    def play(num), do: IO.puts num
end
