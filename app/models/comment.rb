class CommentValidator < ActiveModel::Validator
  def validate(record)
    items = [record.atmosphere, record.growth_potential, record.gap, record.treatment, record.reason_for_retirement]
    return if items.any?(:present?)
    record.errors[:base] << "どれか1つの項目は入力してください。"
  end
end

class Comment < ApplicationRecord
  include ActiveModel::Validations
  validates_with CommentValidator

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


