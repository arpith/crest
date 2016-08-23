class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver, :created_at, :updated_at
end
