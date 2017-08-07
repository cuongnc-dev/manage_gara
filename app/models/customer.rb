class Customer < ApplicationRecord
  belongs_to :locale

  delegate :name, to: :locale, prefix: true

  validates :name, presence: true, length: {minimum: 6, maximum: 100}
end
