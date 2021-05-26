class CreateShuttles < ActiveRecord::Migration[6.0]
  def change
    create_table :shuttles do |t|
      t.string :registration_no, null: false, default: ""
      t.integer :passenger_limit, null: false, default: 0
      t.integer :totel_seats, null: false, default: 0
      t.integer :payment_per_passenger, null: false, default: 0
      
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
