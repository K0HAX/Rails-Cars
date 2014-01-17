namespace :car_app do
  require 'highline/import'

  desc "TODO"
  task add_admin: :environment do
	email = ask('Email address: ') { |q| q.echo = true }
	password = ask('Password: ') { |q| q.echo = '*' }
	password_confirm = ask('Confirm password: ') { |q| q.echo = '*' }

	account = Admin.new :email => email, :password => password, :password_confirmation => password_confirm
	if account.save == true
		puts "User account '#{email}' created."
	else
		puts
		puts "Problem creating user account:"
		puts account.errors.full_messages
	end
  end

end
