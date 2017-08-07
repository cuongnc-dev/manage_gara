class Locale < ApplicationRecord

  has_many :customers

  validates :name, presence: true

  scope :order_by_name, ->{order name: :desc}
end
