defmodule Main do
  def readInt do
        "" |> IO.gets |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    end
   
  def main do
    [t] = readInt()
    for _ <- 1..t do
      [n] = readInt()
      IO.inspect n + n - 1
    end
  end
end
 
 
Main.main()