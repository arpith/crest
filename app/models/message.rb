class Message < ApplicationRecord
  validates :text, presence: true
  validates :sender, presence: true
  validates :receiver, presence: true
end
