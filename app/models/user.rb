class User < ActiveRecord::Base
  has_secure_password
  has_many :wardrobes

  validates :username, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true


  def slug
    self.username.strip.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map { |word| word.downcase }.join(" ")
    self.all.find { |instance| instance.username.downcase == name }
  end
  
end
