class Salon < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  has_one_attached :image
  has_many :comments

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

  #創業年
  validates :established,format: { with: /\A19[0-9]{2}|20[0-9]{2}\z/ }
  validate :established_before_now

  def established_before_now
    return if established.blank?
    errors.add(:established, "は今年以前の西暦を入力してください") if established > Date.today.year
  end

  #店舗数
  validates :offices, numericality: {only_integer: true, greater_than_or_equal_to: 1, message: "店舗数は１以上の数字を入力してください"}
end