class User < ApplicationRecord
  has_secure_password

  validates :login, uniqueness: true, presence: true
end
