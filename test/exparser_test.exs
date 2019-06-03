defmodule ExparserTest do
  use ExUnit.Case
  doctest Exparser

    test "reads a valid file" do
        assert Exparser.lint_file("test/exparser/test_file.json") =~ "Freddy"

    end
end
