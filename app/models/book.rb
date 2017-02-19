class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :item_url, presence: true
  validates :provider, presence: true
end
