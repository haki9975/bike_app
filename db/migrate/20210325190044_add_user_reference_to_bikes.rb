class AddUserReferenceToBikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :bikes, :user, foreign_key: true
  end
end
