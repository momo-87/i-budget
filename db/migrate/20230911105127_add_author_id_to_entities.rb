class AddAuthorIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :author, foreign_key: { to_table: :users }
  end
end
