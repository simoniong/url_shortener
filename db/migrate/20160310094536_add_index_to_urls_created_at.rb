class AddIndexToUrlsCreatedAt < ActiveRecord::Migration
  def change
    add_index :urls, :created_at
  end
end
