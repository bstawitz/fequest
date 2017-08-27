class Feature < ApplicationRecord
  # belongs_to :user
  has_many :comments
  
  validates_presence_of :title, :body

  def vote_score
    return unless upvotes.present? && downvotes.present?
    upvotes - downvotes
  end
end
