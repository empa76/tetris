defmodule Tetris.Element do
  defstruct shape: :l, rotation: 0, location: {5, 1}
  alias Tetris.Point

  def new(options \\ []) do
    __struct__(options)
  end

  def new_random() do
    new(shape: random_shape())
  end

  def right(element) do
    %{element | location: Point.right(element.location)}
  end

  def left(element) do
    %{element | location: Point.left(element.location)}
  end

  def down(element) do
    %{element | location: Point.down(element.location)}
  end

  def rotate(element) do
    %{element | rotation: rotate_degrees(element.rotation)}
  end

  defp rotate_degrees(270) do
    0
  end

  defp rotate_degrees(n) do
    n + 90
  end

  defp random_shape() do
    ~w[l j i o s z t]a
    |> Enum.random()
  end
end
