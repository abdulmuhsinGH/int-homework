# Homework / Worksample

For further information, see the handout.


## Setup Instructions
- Check Ruby version
    - `ruby -v`
    - Should be `ruby 3.0.6`
        - if not, install ruby 3.0.6 using `rbenv` or `rvm`
        - `rvm install 3.0.6`. Here is a [link](https://rvm.io/rvm/install) to install `rvm`
        - `rvm use 3.0.6` to use ruby 3.0.6
        -  Check ruby version again
            - `ruby -v`
            - Should be `ruby 3.0.6`
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
- Using the database to persist and encrypt user credentials informations instead of using `.env` file
- Send `405 Method Not Allowed` response when a request is made to an endpoint with a method that is not allowed instead of `500 Internal Server Error`


