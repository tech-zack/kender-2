class CreateKensis < ActiveRecord::Migration[6.0]
  def change
    create_table :kensis do |t|
      t.string     :title,       null: false
      t.text       :text,        null: false
      t.references :user,        foregin_key: true
      t.timestamps
    end
  end
end
