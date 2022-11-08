class Comment < ApplicationRecord
  belongs_to :authors
  belongs_to :post
end
