class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, :fullname, presence: true, length: {minimum: 5}
end
