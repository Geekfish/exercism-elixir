defmodule Bob do
  def hey(input) do
    cond do
      input =~ ~r/\?$/ -> "Sure."
      input =~ ~r/\p{Lu}{2,}/u -> "Whoa, chill out!"
      String.trim(input) == "" -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
