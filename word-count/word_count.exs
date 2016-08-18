defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    # Remove punctuation and split the words
    words = Regex.replace(~r/[^\p{L}\p{N}\-]/u, sentence, " ") |> String.split

    # Build the counter map
    words |> Enum.reduce(%{}, fn(word, acc) ->
      Map.update(acc, String.downcase(word), 1, &(&1 + 1))
    end)
  end
end
