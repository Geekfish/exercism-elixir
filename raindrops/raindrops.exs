defmodule Raindrops do
  @factor_to_drop %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong",
  }

  def drop_for_factor(number, factor, drop) do
      cond do
        rem(number, factor) == 0 -> drop
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
    raindrops = @factor_to_drop
      |> Enum.reduce("", fn ({factor, drop}, acc) ->
          acc <> drop_for_factor(number, factor, drop) end)
    if raindrops == "", do: to_string(number), else: raindrops
  end
end
