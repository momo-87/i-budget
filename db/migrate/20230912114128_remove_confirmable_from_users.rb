class RemoveConfirmableFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
