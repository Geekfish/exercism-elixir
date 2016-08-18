defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Raises an ArgumentError if the character provided is NOT a nucleotide

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec raise_if_not_nucleotide(char) :: nil
  def raise_if_not_nucleotide(nucleotide) do
      unless Enum.member?(@nucleotides, nucleotide) do
        raise ArgumentError, message: "#{nucleotide} is not a nucleotide."
      end
  end

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    DNA.raise_if_not_nucleotide nucleotide
    DNA.histogram(strand)[nucleotide]
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    # Just a longer way to write:
    # %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    # just in case we want to use other chars for valid nucleotides
    default_map = @nucleotides |> Enum.reduce(%{}, fn (key, acc) ->
      Map.put(acc, key, 0)
    end)

    Enum.reduce strand, default_map, fn(nucl, acc) ->
      DNA.raise_if_not_nucleotide nucl
      Map.update acc, nucl, 1, &(&1 + 1)
    end
  end
end
