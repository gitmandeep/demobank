# frozen_string_literal: true

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
class Account < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :name, :email, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :email, uniqueness: true

  has_many  :nominees,
            foreign_key: 'nominee_to_id',
            class_name: 'Account'

  before_create :generate_number, :default_balance

  def generate_number
    self.number = SecureRandom.random_number(10**6).to_s.rjust(8, "#{Time.now}")
  end

  def default_balance
    self.balance = 1000
  end
end
