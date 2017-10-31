defmodule Main do
  def readInt do
    ""
      |> IO.gets
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
  end
 
  def can(list, val, n) do
    oi = Enum.reduce(list, %{sum: 0, cnt: 1}, fn (at, acc) ->
      if acc.sum + at > val do
        %{sum: at, cnt: acc.cnt + 1}
      else
        %{sum: acc.sum + at, cnt: acc.cnt}
      end
    end)
    oi.cnt <= n
  end
 
  def bb(lo, hi, list, n) do
    m = div(lo + hi, 2)
    cond do
      lo == hi ->
        hi
      can(list, m, n) ->
        bb(lo, m, list, n)
      true ->
        bb(m + 1, hi, list, n)
    end
  end
 
  def main do
    [n, r] = readInt()
    if n != 0 and r != 0 do
      lista = readInt()
      ma = Enum.max(lista)
      IO.inspect bb(ma, 1000 * r + 10, lista, n)
      main()
    end
  end
end
 
Main.main()