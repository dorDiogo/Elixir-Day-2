defmodule Main do
  def readInt do
        {_, [x]} = :io.fread('', '~d')
        x
    end
  def read(0), do: []
  def read(n) do
    min = readInt()
    max = readInt()
    [{min, max} | read(n - 1)]
  end
  def go(list, n, m) do
    cond do
      m == 0 ->
        true
      n == 0 or m < 0 ->
        false
      true -> 
        [head | tail] = list
        {min, max} = head
        x = Enum.reduce(min..max, false, fn i, acc -> acc || go(tail, n - 1, m - i) end)
        x || go(tail, n - 1, m)
    end
  end
  def main do
    t = readInt()
    for _ <- 1 .. t do
      n = readInt()
      m = readInt()
      x = read(n)
      if go(x, n, m) do
        IO.puts "Ok!"
      else
        IO.puts "Corre, Pufe!"
      end
    end
  end
end
 
 
Main.main()