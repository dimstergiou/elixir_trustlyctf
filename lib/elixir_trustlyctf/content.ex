defmodule ElixirTrustlyctf.Content do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contents" do
    field :data, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:name, :data])
    |> validate_required([:name, :data])
  end
end
