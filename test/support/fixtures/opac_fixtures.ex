defmodule DedalosElixirApi.OpacFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DedalosElixirApi.Opac` context.
  """

  @doc """
  Generate a libros.
  """
  def libros_fixture(attrs \\ %{}) do
    {:ok, libros} =
      attrs
      |> Enum.into(%{
        no_reg: 42
      })
      |> DedalosElixirApi.Opac.create_libros()

    libros
  end
end
