defmodule Exparser do
  @moduledoc """
  Documentation for Exparser.
  """

    # def lint_file(filename) do
    #    case File.read(filename) do
    #     {:ok, contents} -> lint(contents)
    #     {:error, reason} -> IO.puts("An error has occured: #{reason}")
    #    end
    # end

    def lint_file(file) do
        with true <- File.exists?(file),
             {:ok, contents} <- File.read(file) do
            lint(contents)
        end
     end




    ## Private functions ##
    def lint(file_contents) do
        IO.inspect(file_contents)
    end
end
