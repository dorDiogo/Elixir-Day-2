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
      str = "" |> IO.gets |> String.trim |> String.to_charlist
      IO.puts (for ch <- str do
        if ch == 32 do
          "Z"
        else
          eae = rem(ch - 33, 36)
          num = div(eae, 12) + 2
          pos = rem(eae, 12)
 
          case pos do
            0 -> "C#{num}"
            1 -> "C##{num}"
            2 -> "D#{num}"
            3 -> "D##{num}"
            4 -> "E#{num}"
            5 -> "F#{num}"
            6 -> "F##{num}"
            7 -> "G#{num}"
            8 -> "G##{num}"
            9 -> "A#{num}"
            10 -> "A##{num}"
            _ -> "B#{num}"
          end
        end
      end |> Enum.join(" "))
      IO.puts ""
    end
  end
end
 
Main.main()