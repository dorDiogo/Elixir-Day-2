defmodule Main do
  def readInt do
    ""
      |> IO.gets
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
  end
 
  def main do
    [t] = readInt()
    for _ <- 1..t do
      [n] = readInt()
      h = n * 30 + (n - 1) * 2
      l = Enum.reduce(1..n, 0, fn (_, acc) -> 
        a = ""
        |> IO.gets
        |> String.to_charlist
        |> Enum.count
        max(acc, (a - 1) * 20)
      end)
      IO.puts "#{h} #{l}"
    end
  end
end
 
Main.main()