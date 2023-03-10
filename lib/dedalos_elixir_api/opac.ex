defmodule DedalosElixirApi.Opac do
  @moduledoc """
  The Opac context.
  """

  import Ecto.Query, warn: false
  alias DedalosElixirApi.Repo

  alias DedalosElixirApi.Opac.Libros
  alias DedalosElixirApi.Opac.Editorial
  alias DedalosElixirApi.Opac.Coleccion
  alias DedalosElixirApi.Opac.Autor
  alias DedalosElixirApi.Opac.Ciudad


  def get_all_libros() do
     Repo.all(Libros)
  end

  def list_libros(params) do
    IO.inspect(params)
    Repo.all(Libros)

  end

  def get_libro(no_reg) do
    Ecto.Query.from(l in Libros,join: e in Editorial,
     on:  l."editorial_id" == e.id, where: l."no_reg" == ^no_reg,
     join: c in Ciudad, on: l."lugar_de_impresión_id" == c.id,
     join: a in Autor, on: l."autor_id" == a.id,
     select: %{
      no_reg: l.no_reg,

      signatura: l.signatura,
      fecha_registro: l.fecha_registro,
      título: l.título,
      edición: l.edición,
      año_impr: l.año_impr,
      idioma_id: l.idioma_id,
      localización: l.localización,
      resumen: l.resumen,
      baja: l.baja,
      solo_consulta: l.solo_consulta,
      en_reparación: l.en_reparación,
      isbn: l.isbn,
      tipo_soporte_id: l.tipo_soporte_id,
      editorial_id: e.nombre_editorial,
      colección_id: l.colección_id,
      autor: a.nombre_autor,
      autor2: l.autor2,
      autor2_id: l.autor2_id,
      autor_id: l.autor_id,
      ciudad: l.ciudad,
      autor3_id: l.autor3_id,
      lugar_de_impresión_id: c.nombre_ciudad
      })
    #|> Ecto.Query.from([l,e] in , select: {})
    |> Repo.all()
    #Repo.get(Libros,no_reg)

    end


  alias DedalosElixirApi.Opac.Editorial

  @doc """
  Returns the list of opac_editorial.

  ## Examples

      iex> list_opac_editorial()
      [%Editorial{}, ...]

  """
  def list_opac_editorial do
    Repo.all(Editorial)
  end

  @doc """
  Gets a single editorial.

  Raises `Ecto.NoResultsError` if the Editorial does not exist.

  ## Examples

      iex> get_editorial!(123)
      %Editorial{}

      iex> get_editorial!(456)
      ** (Ecto.NoResultsError)

  """
  def get_editorial!(id), do: Repo.get!(Editorial, id)

  @doc """
  Creates a editorial.

  ## Examples

      iex> create_editorial(%{field: value})
      {:ok, %Editorial{}}

      iex> create_editorial(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_editorial(attrs \\ %{}) do
    %Editorial{}
    |> Editorial.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a editorial.

  ## Examples

      iex> update_editorial(editorial, %{field: new_value})
      {:ok, %Editorial{}}

      iex> update_editorial(editorial, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_editorial(%Editorial{} = editorial, attrs) do
    editorial
    |> Editorial.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a editorial.

  ## Examples

      iex> delete_editorial(editorial)
      {:ok, %Editorial{}}

      iex> delete_editorial(editorial)
      {:error, %Ecto.Changeset{}}

  """
  def delete_editorial(%Editorial{} = editorial) do
    Repo.delete(editorial)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking editorial changes.

  ## Examples

      iex> change_editorial(editorial)
      %Ecto.Changeset{data: %Editorial{}}

  """
  def change_editorial(%Editorial{} = editorial, attrs \\ %{}) do
    Editorial.changeset(editorial, attrs)
  end

  alias DedalosElixirApi.Opac.Pais

  @doc """
  Returns the list of opac_pais.

  ## Examples

      iex> list_opac_pais()
      [%Pais{}, ...]

  """
  def list_opac_pais do
    Repo.all(Pais)
  end

  @doc """
  Gets a single pais.

  Raises `Ecto.NoResultsError` if the Pais does not exist.

  ## Examples

      iex> get_pais!(123)
      %Pais{}

      iex> get_pais!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pais!(id), do: Repo.get!(Pais, id)

  @doc """
  Creates a pais.

  ## Examples

      iex> create_pais(%{field: value})
      {:ok, %Pais{}}

      iex> create_pais(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pais(attrs \\ %{}) do
    %Pais{}
    |> Pais.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pais.

  ## Examples

      iex> update_pais(pais, %{field: new_value})
      {:ok, %Pais{}}

      iex> update_pais(pais, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pais(%Pais{} = pais, attrs) do
    pais
    |> Pais.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pais.

  ## Examples

      iex> delete_pais(pais)
      {:ok, %Pais{}}

      iex> delete_pais(pais)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pais(%Pais{} = pais) do
    Repo.delete(pais)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pais changes.

  ## Examples

      iex> change_pais(pais)
      %Ecto.Changeset{data: %Pais{}}

  """
  def change_pais(%Pais{} = pais, attrs \\ %{}) do
    Pais.changeset(pais, attrs)
  end

  alias DedalosElixirApi.Opac.Ciudad

  @doc """
  Returns the list of opac_ciudad.

  ## Examples

      iex> list_opac_ciudad()
      [%Ciudad{}, ...]

  """
  def list_opac_ciudad do
    Repo.all(Ciudad)
  end

  @doc """
  Gets a single ciudad.

  Raises `Ecto.NoResultsError` if the Ciudad does not exist.

  ## Examples

      iex> get_ciudad!(123)
      %Ciudad{}

      iex> get_ciudad!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ciudad!(id), do: Repo.get!(Ciudad, id)

  @doc """
  Creates a ciudad.

  ## Examples

      iex> create_ciudad(%{field: value})
      {:ok, %Ciudad{}}

      iex> create_ciudad(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ciudad(attrs \\ %{}) do
    %Ciudad{}
    |> Ciudad.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ciudad.

  ## Examples

      iex> update_ciudad(ciudad, %{field: new_value})
      {:ok, %Ciudad{}}

      iex> update_ciudad(ciudad, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ciudad(%Ciudad{} = ciudad, attrs) do
    ciudad
    |> Ciudad.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ciudad.

  ## Examples

      iex> delete_ciudad(ciudad)
      {:ok, %Ciudad{}}

      iex> delete_ciudad(ciudad)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ciudad(%Ciudad{} = ciudad) do
    Repo.delete(ciudad)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ciudad changes.

  ## Examples

      iex> change_ciudad(ciudad)
      %Ecto.Changeset{data: %Ciudad{}}

  """
  def change_ciudad(%Ciudad{} = ciudad, attrs \\ %{}) do
    Ciudad.changeset(ciudad, attrs)
  end

  alias DedalosElixirApi.Opac.Autor

  @doc """
  Returns the list of opac_autor.

  ## Examples

      iex> list_opac_autor()
      [%Autor{}, ...]

  """
  def list_opac_autor do
    Repo.all(Autor)
  end

  @doc """
  Gets a single autor.

  Raises `Ecto.NoResultsError` if the Autor does not exist.

  ## Examples

      iex> get_autor!(123)
      %Autor{}

      iex> get_autor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_autor!(id), do: Repo.get!(Autor, id)

  @doc """
  Creates a autor.

  ## Examples

      iex> create_autor(%{field: value})
      {:ok, %Autor{}}

      iex> create_autor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_autor(attrs \\ %{}) do
    %Autor{}
    |> Autor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a autor.

  ## Examples

      iex> update_autor(autor, %{field: new_value})
      {:ok, %Autor{}}

      iex> update_autor(autor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_autor(%Autor{} = autor, attrs) do
    autor
    |> Autor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a autor.

  ## Examples

      iex> delete_autor(autor)
      {:ok, %Autor{}}

      iex> delete_autor(autor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_autor(%Autor{} = autor) do
    Repo.delete(autor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking autor changes.

  ## Examples

      iex> change_autor(autor)
      %Ecto.Changeset{data: %Autor{}}

  """
  def change_autor(%Autor{} = autor, attrs \\ %{}) do
    Autor.changeset(autor, attrs)
  end
end
