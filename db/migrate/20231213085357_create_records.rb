class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :position_record
      t.string :item

      t.timestamps
    end
  end
end
