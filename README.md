# Homework / Worksample

For further information, see the handout.


## Setup Instructions
- Check Ruby version
    - `ruby -v`
    - Should be `ruby 2.6.3p62`
    - If not, change the version to what you have installed on your computer in the `Gemfile`. 
- Pre installations before running tests
    - `bundle install`
    - `rake db:migrate`
    - `rake db:seed`
- Duplicate `.env.example` and rename it to `.env` and fill in the values with your own credentials
- change directory to `ruby` folder
    - `cd ruby`
- Run tests
    - `bundle exec rspec spec/`



## API changes Suggestions
- Add a `DELETE` endpoint for deleting articles and authors instead of using a GET MEtohd to handle the deletion of articles and authors
- Make `email` field of `Author` model unique
- Handle duplicate email addresses errors in the `Author` model. Respond with a message that the email address is already taken
- Add `DB_PORT` to `.env.example` template file. This will allow the developers to change the port number of the database if needed
- For db migration add check if the table already exists before creating it OR
    - add migration tasks to alter table when there is a need to add a new column, constraint, etc.

