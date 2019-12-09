defmodule ElixirTrustlyctf.Repo.Migrations.CreateContents do
  use Ecto.Migration

  def change do
    create table(:contents) do
      add :name, :string
      add :data, :string

      timestamps()
    end

  end
end
