defmodule Main do
  def readInt do
        "" |> IO.gets |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    end
  def recognize(str) do
    str = String.to_charlist(str)
    resp = Enum.reverse('Resposta')
    perg = Enum.reverse('Pergunta')
    num = Enum.reverse('Numero')
    {_, ret} = Enum.reduce(str, {[], -1}, fn(ch, {acc, ret}) ->
                          cond do
                            ret != -1 ->
                              {[], ret}
                            ([ch] ++ acc) == perg ->
                              {[], 0}
                            ([ch] ++ acc) == resp ->
                              {[], 1}
                            ([ch] ++ acc) == num ->
                              {[], 2} 
                            true ->
                              {[ch] ++ acc, ret} end end)
    ret
  end
  def go(map) do
    str = IO.gets("") |> String.trim
    x = recognize(str)
    if x == 1 do
      [head | [res]] = String.split(str, ":")
      [_ | [num]] = String.split(head)
      on = String.trim(num) |> String.to_integer
      go(Map.put(map, on, res))
    else
      [_, a | _] = String.split(str, [" ", "!"])
      map[String.to_integer(a)]
    end
      
  end
    
  def task do
    str = IO.gets("") |> String.trim
    if str != "Ole Ole Ola" do
      [head | [perg]] = str |> String.trim |> String.split(":")
      [_ | [num]] = String.split(head)
      on = String.trim(num) |> String.to_integer
      perg = String.trim(perg)
      #IO.puts perg
      ans = go(%{})
      #IO.puts (perg <> ans)
      Map.put(task(), on, perg <> ans)
    else
      %{}
    end
  end
  def main do
    list = Map.to_list(task())
    for {_, value} <- list, do: IO.puts value
     
  end
end
  
IO.gets("")
Main.main()