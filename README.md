## README

###Overview
This is a full-stack web project using Ruby on Rails and AngularJS which allows users to easily browse more than 7000 thousand of Yugioh! cards and sets.

###Demo
https://yugiohdb.herokuapp.com/

###Features
- [Yugioh Prices's API](http://docs.yugiohprices.apiary.io) parser
- elasticsearch to easily search through thousands of cards and sets
- Cards filtering
- User authentication
- Reddit-like comment system
- Page view tracking
- Infinite scroll
- Friendly Bootstrap design

###Setup
- Clone or download the project
- Run `bundle install` and `rake db:migrate`
- Run `rails c` to open the rails console
- The run `CardSet.initialize_set_db`, `Card.initialize_card_db` to pull cards and sets resourses from [Yugioh Prices's API](http://docs.yugiohprices.apiary.io)
- Finally run `CardSet.add_card_image_and_slug_to_sets` to finalize our models.

