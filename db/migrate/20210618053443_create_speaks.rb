class CreateSpeaks < ActiveRecord::Migration[6.0]
  def change
    create_table :speaks do |t|
      t.integer :user_id
      t.integer :kendogu_id
      t.text :text
      t.timestamps
    end
  end
end
