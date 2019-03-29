class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
