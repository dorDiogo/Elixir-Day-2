defmodule Main do
  def readInt do
    ""
      |> IO.gets
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
  end
 
  def tira(str, pat) do
    oi = String.split(str, pat)
    if Enum.count(oi) == 1 do
      hd(oi)
    else
      hd(tl(oi))
    end
  end
 
  def main do
    [t] = readInt()
    oi = Enum.reduce(1..t, MapSet.new, fn(_, acc) ->
      str = "" |> IO.gets |> String.trim
      str = tira(str, "://")
      str = tira(str, "@")
      x = hd(String.split(str, "/"))
      MapSet.put(acc, x)
    end)
    for x <- MapSet.to_list(oi) do
      IO.puts(x)
    end
    # IO.inspect(MapSet.to_list(oi))
  end
end
 
Main.main()