class FriendSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :friend_id
end
