class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :listing
      t.belongs_to :user
      t.string :name
      t.string :phoneno
      t.string :message
      t.boolean :status
      t.timestamps null: false
    end
  end
end
