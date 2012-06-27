class Contact < ActiveRecord::Base
  attr_accessible :email, :company, :name, :phone

  before_save { self.email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true
end
