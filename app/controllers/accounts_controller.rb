# frozen_string_literal: true

class AccountsController < ApplicationController
  def show; end

  def add_nominee; end

  def update_nominee
    nominee = Account.find_by(params[:nominee_to_id])
    if nominee
      nominee.update(nominee_to_id: current_account.id, nominee_weightage: params[:account][:nominee_weightage])
      redirect_to account_path(current_account)
    else
      render 'add_nominee'
    end
  end
end
