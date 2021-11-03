class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :text,                 null: false
      t.text :introduction,           null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_fee_id,     null: false
      t.integer :delivery_source_id,  null: false
      t.integer :until_delivery_id,   null: false
      t.integer :price,               null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
