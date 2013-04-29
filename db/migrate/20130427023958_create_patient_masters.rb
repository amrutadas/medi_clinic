class CreatePatientMasters < ActiveRecord::Migration
  def change
    create_table :patient_masters do |t|
      t.string  :name
      t.integer :age
      t.string  :sex
      t.string  :email,              :null => false, :default => ""
      t.string  :land_line
      t.string  :mobile
      t.string  :location
      t.string  :detailed_address
      t.string  :created_by
      t.timestamps
    end
  end
end
