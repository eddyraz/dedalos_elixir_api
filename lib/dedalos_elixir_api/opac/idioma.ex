defmodule DedalosElixirApi.Opac.Idioma do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_idioma" do
    field :idioma, :string

    #Associations
    has_many :libros , Libros.Idioma_Id

    timestamps()
  end

  @doc false
  def changeset(idioma, attrs) do
    idioma
    |> cast(attrs, [:id, :idioma])
    |> validate_required([:id, :idioma])
  end
end
