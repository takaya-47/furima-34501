class ChangeColumnOfShippings < ActiveRecord::Migration[6.0]
  def change
    change_column_null :shippings, :building, true
  end
end
