defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec regex_split_with_captures(Regex.t, String.t) :: List
  defp regex_split_with_captures(string, regex) do
    Regex.split(regex, string, include_captures: true, trim: true)
  end

  @spec deserialize_encoded(String.t) :: List.t
  defp deserialize_encoded(string) do
    string
      # "3W2A1C" -> ["3W", "2A", "1C"]
      |> regex_split_with_captures(~r/\d+[a-zA-Z]/)
      # -> [["3", "W"], ["2", "A"], ["1", "C"]]
      |> Enum.map(&(regex_split_with_captures(&1, ~r/\d+/)))
  end

  @spec serialize_decoded(List.t) :: String.t
  defp serialize_decoded(list) do
    # [[3, "W"], [2, "A"], [1, "C"]] -> "WWWAAC"
    Enum.reduce(list, "", fn ([num, letter], acc) ->
      acc <> String.duplicate(letter, String.to_integer(num))
    end)
  end

  @spec deserialize_decoded(String.t) :: List.t
  defp deserialize_decoded(string) do
    string
      # "WWWAAC" -> ["WWW", "AA", "C"]
      |> regex_split_with_captures(~r/(.)\1*/)
      # -> [[3, "W"], [2, "A"], [1, "C"]]
      |> Enum.map(fn (str) ->
        [String.length(str), String.first(str)]
      end)
  end

  @spec serialize_encoded(List.t) :: String.t
  defp serialize_encoded(list) do
    # [[3, "W"], [2, "A"], [1, "C"]] -> "3W2A1C"
    Enum.reduce(list, "", fn([num, letter], acc) ->
      acc <> Integer.to_string(num) <> letter
    end)
  end

  @spec encode(String.t) :: String.t
  def encode(string) do
    string |> deserialize_decoded |> serialize_encoded
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string |> deserialize_encoded |> serialize_decoded
  end
end
