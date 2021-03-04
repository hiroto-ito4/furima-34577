class CreateParchases < ActiveRecord::Migration[6.0]
  def change
    create_table :parchases do |t|

      t.timestamps
    end
  end
end
