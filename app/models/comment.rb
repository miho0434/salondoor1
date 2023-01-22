class Comment < ApplicationRecord
  
  with_options length: { minimum: 1, maximum: 500 } do
    validates :atmosphere
    validates :growth_potential
    validates :gap
    validates :treatment 
    validates :reason_for_retirement 
  end

  belongs to :worker
  belongs to :salon  
end