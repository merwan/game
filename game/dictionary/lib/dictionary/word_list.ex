defmodule Dictionary.WordList do
  @me __MODULE__
  @filename "../../assets/words.txt"

  def start_link() do
    Agent.start_link(&word_list/0, name: @me)
  end

  def random_word() do
    Agent.get(@me, &Enum.random/1)
  end

  def word_list do
    @filename
    |> Path.expand(__DIR__)
    |> read()
    |> split()
  end

  defp read(filename) do
    File.read!(filename)
  end

  defp split(contents) do
    String.split(contents, "\n")
  end
end
