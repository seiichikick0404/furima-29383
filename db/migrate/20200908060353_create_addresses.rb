class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postal, null: false
      t.integer   :genre_id, null: false
      t.string    :city, null: false
      t.string    :house_num, null: false
      t.string    :building, null: false
      t.integer   :phone, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
