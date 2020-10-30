class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|

    	t.references :slot, foreign_key: true
    	t.references :patient, foreign_key: {to_table: :users}
    	t.date :appointment_date

      t.timestamps
    end
  end
end
