class CreateUserInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :user_infos do |t|
      t.string :bio
      t.belongs_to :user

      t.timestamps
    end
  end
end
