class ChangeColumnOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :explain, false
    change_column_null :items, :price, false
  end
end
