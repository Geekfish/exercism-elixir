defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  def recursive_map([head | tail], fun) do
    [fun.(head) | recursive_map(tail, fun)]
  end
  def recursive_map([], fun) do
    []
  end

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    # "Cheating" via builtin map function:
    # list |> Enum.map(fun)

    # Probably still cheating via comprehension:
    # for item <- list, do: fun.(item)

    # Let's solve this with recursion:
    Accumulate.recursive_map(list, fun)
  end
end
