defmodule TodoServiceElixir.Admin.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "todos" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
