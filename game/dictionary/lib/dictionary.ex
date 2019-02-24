defmodule Dictionary do
  @filename "../assets/words.txt"

  def random_word do
    word_list()
    |> select()
  end

  defp word_list do
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

  defp select(word_list) do
    Enum.random(word_list)
  end
end
