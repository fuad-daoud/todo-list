defmodule Todolist.TodosTest do
  use Todolist.DataCase

  alias Todolist.Todos

  describe "todos" do
    alias Todolist.Todos.Todo

    import Todolist.TodosFixtures

    @invalid_attrs %{title: nil, author: nil, content: nil, created_at: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Todos.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todos.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{title: "some title", author: "some author", content: "some content", created_at: ~U[2025-04-26 00:45:00Z]}

      assert {:ok, %Todo{} = todo} = Todos.create_todo(valid_attrs)
      assert todo.title == "some title"
      assert todo.author == "some author"
      assert todo.content == "some content"
      assert todo.created_at == ~U[2025-04-26 00:45:00Z]
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{title: "some updated title", author: "some updated author", content: "some updated content", created_at: ~U[2025-04-27 00:45:00Z]}

      assert {:ok, %Todo{} = todo} = Todos.update_todo(todo, update_attrs)
      assert todo.title == "some updated title"
      assert todo.author == "some updated author"
      assert todo.content == "some updated content"
      assert todo.created_at == ~U[2025-04-27 00:45:00Z]
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo(todo, @invalid_attrs)
      assert todo == Todos.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Todos.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo(todo)
    end
  end
end
