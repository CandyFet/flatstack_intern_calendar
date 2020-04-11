class AddUseridToRecurringevent < ActiveRecord::Migration[5.2]
  def change
    add_reference :recurring_events, :user, foreign_key: true
  end
end
