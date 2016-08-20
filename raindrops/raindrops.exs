defmodule Raindrops do
  @factor_to_drop %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong",
  }

  def drop_for_factor(number, factor) do
      cond do
        rem(number, factor) == 0 -> @factor_to_drop[factor]
        true -> ""
      end
  end

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    factors = Map.keys(@factor_to_drop)
    raindrops = factors
      |> Enum.reduce("", fn (factor, acc) ->
          acc <> drop_for_factor(number, factor) end)
    if raindrops == "", do String.Chars.to_string number else raindrops
  end
end
