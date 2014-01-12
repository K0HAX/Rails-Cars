Rails-Cars
==========

I made this rails app to help me keep track of my vehicles, cars, bikes, motorcycles, etc...

To create a new admin user, do the following!

rails c
Loading development environment (Rails 3.0.0.beta3)
irb(main):001:0> admin = Admin.create! do |u|
irb(main):002:1> u.email = 'sample@sample.com'
irb(main):003:1> u.password = 'password'
irb(main):004:1> u.password_confirmation = 'password'
irb(main):005:1> end
