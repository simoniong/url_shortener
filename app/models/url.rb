require 'net/http'
class Url < ActiveRecord::Base
  #validates :shorten_url, presence: true
  validates :origin_url, presence: true, url: true
  validates :token, uniqueness: true, allow_blank: true, length: { is: 8 }
  validate :check_url_valid

  CHARSETS = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  UNIQUE_KEY_LENGTH = 8

  before_create :generate_or_use_token

  protected

  def check_url_valid
    # if origin_url is not a valid url, then no need to check
    return if self.errors[:origin_url].present?

    # get through by test it
    result = Net::HTTP.get_response(URI.parse(self.origin_url))
    return if result.is_a?(Net::HTTPSuccess) || result.is_a?(Net::HTTPRedirection)
    errors.add(:origin_url, :not_pass_through)
  end

  def generate_or_use_token
    return if token.present?
    token = self.class.generate_unique_token
    self.token = self.class.generate_unique_token
  end

  def self.generate_unique_token
    token = gen_token
    while self.where(token: token).first do
      token = gen_token
    end
    token
  end

  def self.gen_token
    (0...Url::UNIQUE_KEY_LENGTH).map{ CHARSETS[rand(CHARSETS.size)] }.join
  end

  def self.clean_up_old_url
    logger.info "Kick start clean up job"
    self.where("created_at <= ?", Time.zone.now - 15.days).delete_all
    logger.info "Finished clean up job"
  end
end
