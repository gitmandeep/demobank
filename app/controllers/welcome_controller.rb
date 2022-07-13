# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :authenticate_account!

  def home; end
end
