class Url < ActiveRecord::Base
  validates :shorten_url, presence: true
  validates :origin_url, presence: true
  validates :token, presence: true
end
