defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @require_params [:date, :calories, :description]

  @derive {Jason.Encoder, only: [:id, :calories, :date, :description]}

  schema "meals" do
    field(:calories, :integer)
    field(:date, :date)
    field(:description, :string)
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @require_params)
    |> validate_required(@require_params)
  end
end
