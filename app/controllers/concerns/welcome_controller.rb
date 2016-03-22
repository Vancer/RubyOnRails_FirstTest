class WelcomeController < ApplicationController
	def index
	end

	def about
	end

	def secure_data
		#make sure hes logged in
		#if not redirect to main page
		if true #notlogged in
			redirect_to controller: 'welcome', action: root_path
		end

		#if logged in
		#render secure data


	end
end