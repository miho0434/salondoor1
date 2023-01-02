class CommentValidator < ActiveModel::Validator
  def validate(record)
    items = [record.atmosphere, record.atmosphere, record.gap, record.treatment, record.reason_for_retirement]
    return if items.any?(:present?)
    record.errors[:base] << 'どれか1つの項目は入力してください。'
  end
  
end