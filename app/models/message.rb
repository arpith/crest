class Message < ApplicationRecord
  validates :text, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
