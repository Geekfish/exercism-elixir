defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
      # Clear punctuation
      |> String.replace(~r/[^\p{L}\p{N}]/u, " ")
      # Split words that are stuck together
      # ex: FooBar -> Foo Bar
      |> String.replace(~r/([\p{Ll}])([\p{Lu}])/u, "\\1 \\2")
      |> String.upcase
      |> String.split
      |> Enum.map(fn word -> String.to_charlist(word) end)
      # Stick the first char of each word together
      |> Enum.reduce('', fn ([head | _tail], acc) -> acc ++ [head] end)
      |> String.Chars.to_string
  end
end
