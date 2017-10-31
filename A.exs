defmodule Main do
  def readInt do
    ""
      |> IO.gets
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
  end
 
  def solve(h, n) do
    cond do
      :math.pow(2, h) - 1 > n ->
        solve(h-1, n)
      2 * (:math.pow(2, h) - 1) == n ->
        h
      true ->
        solve(h-1, n - :math.pow(2, h) + 1)
    end
  end
 
  def main do
    [t] = readInt()
    for _ <- 1..t do
      [n] = readInt()
      IO.inspect solve(16, n)
    end
  end
end
 
Main.main()