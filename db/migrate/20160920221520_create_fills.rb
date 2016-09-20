class CreateFills < ActiveRecord::Migration
  def change
    create_table :fills do |t|
      t.string :patient_name

      t.timestamps null: false
    end
  end
end
