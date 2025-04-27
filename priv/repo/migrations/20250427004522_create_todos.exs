defmodule Todolist.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :content, :string
      add :title, :string
      add :author, :string
      add :created_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
