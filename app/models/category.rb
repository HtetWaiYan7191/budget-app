class Category < ApplicationRecord
  belongs_to :user
  has_many :category_purchases, dependent: :destroy
  has_many :purchases, through: :category_purchases

  # scope for searching
  scope :search_by_name, ->(query) { where('name LIKE ?', "%#{query}%") }

  validates :name, :icon, presence: true
end
