class Comment < ApplicationRecord
  belongs to :worker
  belongs to :salon

  validates_with CommentValidator

  with_options length: { minimum: 10, maximum: 500 } do
    validates :atmosphere
    validates :growth_potential
    validates :gap
    validates :treatment 
    validates :reason_for_retirement 
  end

end
