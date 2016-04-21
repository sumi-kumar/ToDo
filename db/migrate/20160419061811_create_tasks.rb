class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :note
      t.date :completion_date
      t.references :taskable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
