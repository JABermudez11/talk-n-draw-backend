class Conversation < ApplicationRecord
    belongs_to :messenger, class_name: "User", foreign_key: "messenger_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
    
    has_many :messages, dependent: :destroy

    def users
        [self.messenger, self.receiver]
    end
end
