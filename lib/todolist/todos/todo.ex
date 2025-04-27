defmodule Todolist.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string
    field :author, :string
    field :content, :string
    field :created_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:content, :title, :author, :created_at])
    |> validate_required([:content, :title, :author, :created_at])
  end
end
