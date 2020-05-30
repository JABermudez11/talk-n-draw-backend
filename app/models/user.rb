class User < ApplicationRecord
    has_secure_password    
    validates :username, uniqueness: :true

    has_many :owner_users, foreign_key: :friend_id, class_name: 'Pending'
    has_many :friends, through: :owner_users

    has_many :friend_users, foreign_key: :owner_id, class_name: 'Pending'
    has_many :owners, through: :friend_users

    has_many :owner_users, foreign_key: :friend_id, class_name: 'Friend'
    has_many :friends, through: :owner_users

    has_many :friend_users, foreign_key: :owner_id, class_name: 'Friend'
    has_many :owners, through: :friend_users

    
end
