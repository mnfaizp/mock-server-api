class CreateRedeemCodes < ActiveRecord::Migration[7.2]
  def change
    create_table :redeem_codes, id: false do |t|
      t.string :code, null: false, primary_key: true
      t.datetime :start_redeem_at, null: false
      t.datetime :end_redeem_at, null: false
      t.boolean :status, default: false, null: false

      t.timestamps
    end
  end
end
