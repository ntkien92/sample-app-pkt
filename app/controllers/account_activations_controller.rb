# Account Activation
class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      account_activated user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

  private

  def account_activated(user)
    log_in user
    flash[:success] = 'Account activated!'
    redirect_to user
  end
end
