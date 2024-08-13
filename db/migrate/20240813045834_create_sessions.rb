class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions, id: false do |t|
      # add foreign key code from redeem_codes
      t.string :redeem_code, null: false
      t.foreign_key :redeem_codes, column: :redeem_code, primary_key: :code
      t.string :sequence, null: false
      t.string :state, null: false, primary_key: true
      t.boolean :attendance_status, default: false, null: false

      t.timestamps
    end
  end
end
