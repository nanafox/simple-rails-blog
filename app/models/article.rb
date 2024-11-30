# Articles model
class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  scope :by_query, ->(query) {
          where("title LIKE ?", "%#{query}%") if query.present?
        }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
