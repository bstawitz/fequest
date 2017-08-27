class Comment < ApplicationRecord
  belongs_to :feature
  # has_many :children, :class_name => "Comment"
  # belongs_to :parent, :class_name => "Comment"

  validates_presence_of :body
  
  def votes_score
    upvotes - downvotes
  end
end
