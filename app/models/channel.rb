class Channel < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  validates :name, presence: true, length: { minimum: 2 }
end
