class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, uniqueness: {case_sensitive: false}, presence: true
  validates :email, format: { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }, presence: true
end
