class AddUsersToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :messenger_id, :integer
    add_column :conversations, :receiver_id, :string
  end
end
