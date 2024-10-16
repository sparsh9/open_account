class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :account_holder_name
      t.decimal :opening_amount
      t.decimal :opening_bonus
      t.decimal :closing_amount

      t.timestamps
    end
  end
end
