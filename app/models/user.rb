class User < ActiveRecord::Base
  has_secure_password
  has_many :wardrobes

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def slug
    self.username.strip.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map { |word| word.downcase }.join(" ")
    self.all.find { |instance| instance.username.downcase == name }
  end

end
