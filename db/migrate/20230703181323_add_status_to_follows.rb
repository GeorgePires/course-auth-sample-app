class AddStatusToFollows < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :status, :string, default: 'pending'
    Follow.update_all(status: 'accepted')
  end
end
