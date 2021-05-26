class CreateUserShuttleSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_shuttle_seats do |t|
      t.column :seat_no, :integer
      t.column :state, :string

      t.references :shuttle, index: true
      t.references :user, index: true
      t.references :user_shuttle, index: true
      t.timestamps
    end
  end
end
