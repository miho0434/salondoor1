class Salon < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :store_name
    validates :corporate_name
    validates :prefecture_id
    validates :city
    validates :street_number
    validates :station
    validates :established
    validates :offices
  end

  #都道府県
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  
  #店舗数
  validates :offices, numericality: {only_integer: true, greater_than_or_equal_to: 1, message: "１以上の数字を入力してください"}
end