class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name
      t.text       :explain
      t.integer    :price
      t.references :user,            null: false, foreign_key: true
      t.integer    :category_id,     null: false
      t.integer    :item_status_id,  null: false
      t.integer    :shipping_fee_id, null: false
      t.integer    :prefecture_id,   null: false
      t.integer    :delivery_id,     null: false
      t.timestamps
    end
  end
end
