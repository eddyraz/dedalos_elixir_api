defmodule DedalosElixirApi.Opac.Pais do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_pais" do
    field :codigo_iso, :string
    field :nombre, :string

    #Associations
    belongs_to(:editorial, Editorial.Id)

    timestamps()
  end

  @doc false
  def changeset(pais, attrs) do
    pais
    |> cast(attrs, [:id, :nombre, :codigo_iso])
    |> validate_required([:id, :nombre, :codigo_iso])
  end
end
