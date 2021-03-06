class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.timestamp :commited_at
      t.references :user, index: true, foreign_key: true
      t.string :sha
      t.text :message

      t.timestamps null: false
    end
  end
end
