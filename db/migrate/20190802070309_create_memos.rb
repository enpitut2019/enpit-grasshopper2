class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.references :record, foreign_key: true
      t.string :memo
      t.integer :like_count, default: 0
      t.timestamps
    end
  end
end
