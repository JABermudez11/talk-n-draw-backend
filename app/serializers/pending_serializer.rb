class PendingSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :friend_id
end
