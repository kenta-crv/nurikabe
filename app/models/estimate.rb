class Estimate < ApplicationRecord
  serialize :wide, Array
  belongs_to :company, optional: true
  validates :name, {presence: true}  #名前
  validates :tel, {presence: true} #電話番号
  validates :address, {presence: true} #住所
  validates :email, {presence: true} #メールアドレス
  validates :period, {presence: true} #住所
  validates :remarks, {presence: true} #住所
end