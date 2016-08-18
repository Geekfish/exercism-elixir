defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @planet_factors %{
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
  }

  @doc """
  Return the number of years a person that has lived on earth, divided by
  any factor
  """
  @spec earth_age_divided_by_factor(pos_integer, float) :: float
  def earth_age_divided_by_factor(seconds, factor) do
    ( seconds / 31_557_600 ) / factor
  end

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_age_divided_by_factor seconds, @planet_factors[planet]
  end
end
