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

  @doc """
  Generate a editorial.
  """
  def editorial_fixture(attrs \\ %{}) do
    {:ok, editorial} =
      attrs
      |> Enum.into(%{
        id: 42,
        nombre_editorial: "some nombre_editorial",
        pais_origen_id: 42
      })
      |> DedalosElixirApi.Opac.create_editorial()

    editorial
  end

  @doc """
  Generate a pais.
  """
  def pais_fixture(attrs \\ %{}) do
    {:ok, pais} =
      attrs
      |> Enum.into(%{
        codigo_iso: "some codigo_iso",
        id: 42,
        nombre: "some nombre"
      })
      |> DedalosElixirApi.Opac.create_pais()

    pais
  end

  @doc """
  Generate a ciudad.
  """
  def ciudad_fixture(attrs \\ %{}) do
    {:ok, ciudad} =
      attrs
      |> Enum.into(%{
        id: 42,
        nombre_ciudad: "some nombre_ciudad",
        nombre_pais: "some nombre_pais",
        nombre_pais_id: 42
      })
      |> DedalosElixirApi.Opac.create_ciudad()

    ciudad
  end

  @doc """
  Generate a autor.
  """
  def autor_fixture(attrs \\ %{}) do
    {:ok, autor} =
      attrs
      |> Enum.into(%{
        id: 42,
        nombre_autor: "some nombre_autor"
      })
      |> DedalosElixirApi.Opac.create_autor()

    autor
  end
end
