# Comments model
#
# This model handles the association of comments to the articles.
# Each article can have multiple comments but a comment belongs to a single
# article at a time.
class Comment < ApplicationRecord
  belongs_to :article

  validates :body, :commenter, presence: true
end
