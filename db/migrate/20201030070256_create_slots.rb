class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
    	t.time :start_time
    	t.time :end_time
    	t.references :doctor, foreign_key: {to_table: :users}
    	t.boolean :availability, default: true
    	t.string :slot_type
    	t.date :date

      t.timestamps
    end
  end
end
