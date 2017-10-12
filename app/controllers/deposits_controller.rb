class DepositsController < ApplicationController
  before_action :signed_in
  def index
    @phone_number = current_user.phone_number
    @deposit = Deposit.new
  end

  def create
    @deposit = current_user.deposits.new(deposit_params)
    if @deposit.save
      bal = current_user.balance.to_i
      bal = bal + @deposit.amount.to_i
      current_user.update(balance:bal)
      flash[:notice]='Deposit Was Succesfull.'
      redirect_to dashboard_path
    else
      flash[:alert]='Errors Were Encountered. Please Try Again.'
      redirect_to dashboard_path
    end
  end

  private
  def deposit_params
    params.require(:deposit).permit(:amount,:phone_number)
  end
end
