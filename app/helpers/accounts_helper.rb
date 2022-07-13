# frozen_string_literal: true

module AccountsHelper
  def nominee_list(account)
    ids = (account.nominees.pluck(:id) + [account]).compact
    Account.where.not(id: ids).map { |ac| [ac.email, ac.id] }
  end
end
