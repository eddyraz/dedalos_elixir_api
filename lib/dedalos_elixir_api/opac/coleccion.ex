defmodule DedalosElixirApi.Opac.Coleccion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_coleccion" do

    field :nombre_coleccion, :string

    #Associations
    has_many :libros , Libros.Coleccion_Id

    timestamps()
  end

  @doc false
  def changeset(coleccion, attrs) do
    coleccion
    |> cast(attrs, [:id, :nombre_coleccion])
    |> validate_required([:id, :nombre_coleccion])
  end
end
