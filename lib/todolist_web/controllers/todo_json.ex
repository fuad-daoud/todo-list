defmodule TodolistWeb.TodoJSON do
  alias Todolist.Todos.Todo

  @doc """
  Renders a list of todos.
  """
  def index(%{todos: todos}) do
    %{data: for(todo <- todos, do: data(todo))}
  end

  @doc """
  Renders a single todo.
  """
  def show(%{todo: todo}) do
    %{data: data(todo)}
  end

  defp data(%Todo{} = todo) do
    %{
      id: todo.id,
      content: todo.content,
      title: todo.title,
      author: todo.author,
      created_at: todo.created_at
    }
  end
end
