defmodule DedalosElixirApi.Opac.Autor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_autor" do

    field :nombre_autor, :string

    #Associations
    has_many :libros , Libros.Autor


    timestamps()
  end

  @doc false
  def changeset(autor, attrs) do
    autor
    |> cast(attrs, [:id, :nombre_autor])
    |> validate_required([:id, :nombre_autor])
  end
end
