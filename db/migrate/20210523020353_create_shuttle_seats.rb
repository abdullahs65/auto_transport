class CreateShuttleSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :shuttle_seats do |t|
      t.column :seat_no, :integer
      
      t.references :shuttle, index: true
      t.timestamps
    end
  end
end
