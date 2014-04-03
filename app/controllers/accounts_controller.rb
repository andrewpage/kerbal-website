class AccountsController < ApplicationController

	private
	def account_params
		params.require(:account).permit(:username, :first_name, :last_name, :country)
	end
end
