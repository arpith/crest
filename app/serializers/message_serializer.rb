class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver, :text, :created_at, :updated_at
end
