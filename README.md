README

Walk-eze is a Ruby on Rails Dog Walking App

This app provides a database and web interface for users to create an account to book Dog walks from Dog Walkers offering walks.

This is not intended to be a full webstore product, but only and booking system. It is a sample only.

The App is preloaded with available walks, each with a duration, limited number of dogs, and notes

Users can create an User Account and then they can add dogs so they can book walks They can edit or cancel their walks and add notes that only the walker can see about each of their dogs on the walk. The user can see a list of all the walks available, all the walks they have booked and for all of those walks, see which dogs are booked - both theirs and others.

This app was built with Ruby on Rails, using the Omniauth Gem and the Activeadmin gem for login functionality. The thin gem was used for https access.

Usage: In the terminal, run bundle install to install Ruby gem dependencies, and rake db:seed to seed the DB. You can start a secure ruby server using the thin start --ssl command shotgun and navigate to https://localhost:3000 in your browser.

Contributing Bug reports and pull requests are welcome on GitHub at https://github.com/TrevorSeitz/walkeze.

License The app is available as open source under the terms of the MIT License.
