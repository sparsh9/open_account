class AccountsController < ApplicationController
  before_action :set_account, only: [:edit, :update, :destroy]

  def index
    @accounts = Account.all.order(id: :asc)
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @account is set by the before_action
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to account_path(@account), notice: 'Account was successfully deleted.'
  rescue ActiveRecord::RecordNotDestroyed
    redirect_to accounts_path, alert: 'There was an error deleting the account.'
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account_holder_name, :opening_amount, :opening_bonus)
  end
end
