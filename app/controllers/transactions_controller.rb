class TransactionsController < ApplicationController
    before_action :signed_in
    def index
      @transaction = Transaction.new
    end

    def create
      @transaction = Transaction.new(transaction_params)
      if @transaction.receiver_identifier_type=='phone'
        @receiver = User.find_by(phone_number:@transaction.receiver_identifier)
      elsif @transaction.receiver_identifier_type=='email'
        @receiver = User.find_by_email(@transaction.receiver_identifier)
      end
      if @receiver
        if current_user.balance.to_i<@transaction.amount.to_i
          flash[:alert]='You dont have enough money in your account to make the transaction.'
          redirect_to transactions_path
        else
          @transaction.update(sender_id:current_user.id,receiver_id:@receiver.id)
          us_bal = current_user.balance.to_i
          us_bal = us_bal - @transaction.amount.to_i
          current_user.update(balance:us_bal)
          rv_bal = @receiver.balance.to_i
          rv_bal = rv_bal + @transaction.amount.to_i
          @receiver.update(balance:rv_bal)
          flash[:notice]='Transaction was completed successfully.'
          redirect_to dashboard_path
        end
      else
        flash[:alert]='No User was found with the given email or phone number.'
        redirect_to transactions_path
      end
    end

    private
    def transaction_params
      params.require(:transaction).permit(:amount,:receiver_identifier, :receiver_identifier_type)
    end
end
