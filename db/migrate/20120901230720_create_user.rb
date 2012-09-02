class CreateUser < ActiveRecord::Migration
  def up
	create_table :users do |t|
		t.string :provider
		t.string :uid
		t.string :name
		t.string :role

		t.timestamps
  	end
  end

  def down
  end
end
