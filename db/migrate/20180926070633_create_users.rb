class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :limit => 45, :null => false
      t.string :email, :limit => 45, :null => false

      t.timestamps
    end
  end
end
