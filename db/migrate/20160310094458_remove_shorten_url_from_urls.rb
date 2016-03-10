class RemoveShortenUrlFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :shorten_url
  end
end
