class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :email, format: { with: /\A#{URI::MailTo::EMAIL_REGEXP}\z/ },
                uniqueness: { case_sensitive: false }
end
