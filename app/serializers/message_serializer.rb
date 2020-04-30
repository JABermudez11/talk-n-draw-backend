class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :conversation_id, :user
  has_one :user
  has_one :conversation
end
