class CreateUserShuttles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_shuttles do |t|
      t.column :started_at, :datetime
      t.column :ends_at, :datetime
      t.column :no_of_seats, :integer
      t.column :state, :string
      t.column :user_payment_status, :string
      t.column :user_payment, :integer

      
      
      t.references :user, index: true
      t.references :shuttle, index: true
      t.timestamps
    end
  end
end
