defmodule Todolist.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        author: "some author",
        content: "some content",
        created_at: ~U[2025-04-26 00:45:00Z],
        title: "some title"
      })
      |> Todolist.Todos.create_todo()

    todo
  end
end
