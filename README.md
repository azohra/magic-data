# Magic Data

Magic Data is a lean and un-opinionated data generator where you provide the generation techniques! Generators can be set as a block or as a static value. Data generation is handled by requesting a specifc key or modifying a passed in hash. Most importantly, Magic Data supports retrieving the most recently generated value of any key!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'magic_data'
```

## Usage

##### Creating generators with a block
Input keys can be strings or symbols, you decide! 
```ruby
MagicData.set('~username') {rand(36**10).to_s(36) << '.51d281ef@mailosaur.io'}
MagicData.set(:password) {rand(36**10).to_s(36)}
```

##### Creating generators with a static value
Input values will be converted to a string for retrieval. 
```ruby
MagicData.set('~existing_username', 'tk8817@test.com')
MagicData.set('~existing_username', FigNewton.existing_password) #example uses Cheezy's FigNewton lib
```

##### Invoking block generators
This will return a value generated from the block provided during creation
```ruby
MagicData.get('~username')
# => ch3jdb68sjhnss21.51d281ef@mailosaur.io

MagicData.get(:password)
# => h4dnsah28s2hs27hd3
```

##### Retrieving latest block generated value 
Non existent values will return as nil
```ruby
MagicData.get_latest(:password)
# => h4dnsah28s2hs27hd3

MagicData.get_latest('not_real')
# => nil
```

##### Modifying hash with magic_data (return full hash)
```ruby
input = {user_login: '~username', :user_password => :password, user_phone: '555-555-5555'}
MagicData.process(input)
# => {user_login: 'vb39hsb2s.51d281ef@mailosaur.io', user_password: '9fj4h3hnssoqlks', user_phone: '555-555-5555'}
```

##### Modifying hash with magic_data (return only modified data)
```ruby
input = {user_login: '~username', user_password: '~password', user_phone: '555-555-5555'}
MagicData.process(input, true)
# => {user_login: 'dh2nsh17ahs.51d281ef@mailosaur.io', user_password: 'k4jn60d2ja'}
```

##### Invoking static value
This will return the static value set during creation
```ruby
MagicData.get('~existing_username')
# => tk8817@test.com
```

##### Retrieving latest static value
There is not much value in this, but you can do it.
```ruby
MagicData.get__latest('~existing_username')
# => tk8817@test.com
```

## Development


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
