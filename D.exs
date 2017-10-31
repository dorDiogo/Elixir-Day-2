defmodule Main do
  def readInt do
    ""
      |> IO.gets
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
  end
 
  def go([], set, cost, total) do
    if MapSet.size(set) == total do
      cost
    else
      16 * 10000 + 313
    end
  end
 
  def go([head | tail], set, cost, total) do
    min(go(tail, set, cost, total), go(tail, MapSet.union(set, head.sabores), cost + head.p, total))
  end
 
  def main do
    [t] = readInt()
    for _ <- 1..t do
      [n] = readInt()
      duelos = Enum.map(1..n, fn(_) ->
        [p, _ | sabores] = "" |> IO.gets |> String.trim |> String.split
        p = String.to_integer(p)
        sabores = MapSet.new(sabores)
        %{p: p, sabores: sabores}
      end)
      cnt = Enum.reduce(duelos, MapSet.new(), fn(d, acc) ->
        MapSet.union(acc, d.sabores)
      end) |> MapSet.size
      IO.inspect go(duelos, MapSet.new, 0, cnt)
    end
  end
end
 
Main.main()