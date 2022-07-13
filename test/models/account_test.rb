# == Schema Information
#
# Table name: accounts
#
#  id                 :bigint           not null, primary key
#  balance            :integer
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  name               :string
#  nominee_weightage  :integer
#  number             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  nominee_to_id      :integer
#
# Indexes
#
#  index_accounts_on_email  (email) UNIQUE
#
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
