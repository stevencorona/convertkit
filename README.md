# Convertkit

Rubygem for the excellent Converkit app. Note: this only supports V2 API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'convertkit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install convertkit

## Usage

First, configure your client like so:

	client = Convertkit::Client.new(key: "apikey")

### Get list of forms

	forms = client.forms

Will give you back something like this (a ConvertKit::Form object)

	form.id
	form.subscriber_count
	form.name
	form.details
	form.embed

## Subscribe to a form

	form = client.form(4)
	form.subscribe(email: "email@email.com", fname: "name", course_opted: true)

## Form details

	form = client.form(4)




## Contributing

1. Fork it ( https://github.com/[my-github-username]/convertkit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
