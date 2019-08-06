class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :goal
      t.string :daily_task
      t.integer :monthly_score
      t.integer :experience, default: 0
      t.string :avatar_url
      t.timestamps
    end
  end
end
