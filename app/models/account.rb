class Account < ApplicationRecord
  after_create :generate_account_number
  before_save :calculate_closing_balance


  def self.generate_account_number
    number = rand(1000000...9999999)
    while Account.exists?(account_number: number)
      number = rand(1000000...9999999)
    end
    number
  end

  private

  def generate_account_number
    self.account_number = Account.generate_account_number
    save
  end

  def calculate_closing_balance
    self.closing_amount = opening_amount.to_f + opening_bonus.to_f
  end
end
