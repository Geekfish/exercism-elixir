defmodule Sublist do
  require Logger
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  @spec sublist?(list, list) :: bool
  def sublist?(a, b) when length(b) > length(a) do
      Enum.find_value(0..(length(b) - length(a)), false, fn(start) ->
        a === Enum.slice(b, start, length(a))
      end)
  end
  def sublist?(a, b) do
    false
  end
end
