class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shorten_url
      t.string :origin_url
      t.string :token
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
