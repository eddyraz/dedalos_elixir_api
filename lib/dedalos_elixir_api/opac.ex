defmodule DedalosElixirApi.Opac do
  @moduledoc """
  The Opac context.
  """

  import Ecto.Query, warn: false
  alias DedalosElixirApi.Repo

  alias DedalosElixirApi.Opac.Libros

  @doc """
  Returns the list of opac_libro_legacy.

  ## Examples

      iex> list_opac_libro_legacy()
      [%Libros{}, ...]

  """
  def list_opac_libro_legacy do
     Repo.all(Libros)
  end

  @doc """
  Gets a single libros.

  Raises if the Libros does not exist.

  ## Examples

      iex> get_libros!(123)
      %Libros{}

  """
  def get_libros!(_id), do: raise "TODO"

  @doc """
  Creates a libros.

  ## Examples

      iex> create_libros(%{field: value})
      {:ok, %Libros{}}

      iex> create_libros(%{field: bad_value})
      {:error, ...}

  """
#  def create_libros(attrs \\ %{}) do
#    raise "TODO"
#  end

  @doc """
  Updates a libros.

  ## Examples

      iex> update_libros(libros, %{field: new_value})
      {:ok, %Libros{}}

      iex> update_libros(libros, %{field: bad_value})
      {:error, ...}

  """
#  def update_libros(%Libros{} = libros, attrs) do
#    raise "TODO"
#  end

  @doc """
  Deletes a Libros.

  ## Examples

      iex> delete_libros(libros)
      {:ok, %Libros{}}

      iex> delete_libros(libros)
      {:error, ...}

  """
#  def delete_libros(%Libros{} = libros) do
#    raise "TODO"
#  end

  @doc """
  Returns a data structure for tracking libros changes.

  ## Examples

      iex> change_libros(libros)
      %Todo{...}

  """
  def change_libros(%Libros{} = libros, _attrs \\ %{}) do
    raise "TODO"
  end
end
