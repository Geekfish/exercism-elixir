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
      # Split the word chars
      |> Enum.map(fn word -> String.split(word, "") end)
      # Append only the first char to the acronym
      |> Enum.reduce("", fn ([head | _tail], acc) -> acc <> head end)
  end
end
