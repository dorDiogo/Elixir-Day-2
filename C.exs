defmodule Main do
  def readInt do
        "" |> IO.gets |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    end
  def go([], _, _), do: 0.0
  def go([comp | tail], q, qtd) do
    tot = Enum.reduce(comp, 0, fn val, acc -> val + acc end)
    qiesimo = Enum.take(comp, q) |> Enum.reverse |> hd
    qiesimo/tot * qtd + go(tail, q, qtd)
  end
   
  def main do
    [t] = readInt()
    for _ <- 1..t do
      [n, _] = readInt()
      input = for _ <- 1..n do
        readInt()
      end
      [q] = readInt()
      :io.fwrite("~.2f\n", [go(input, q, 1.0 / n)])
       
    end
  end
end
 
 
Main.main()