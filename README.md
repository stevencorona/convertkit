# Convertkit

Rubygem for the excellent Converkit. Allows you to get forms, courses, and subscribe people to your mailing lists.

*Only supports the v2 API*

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

	#<ConvertKit::Form:0x007fc5020ae460
 		@client=
  			#<ConvertKit::Client:0x007fc502846830
   				@key="xxxx",
   				@uri="https://api.convertkit.com",
   				@version=2>,
 		@created_at="2014-12-02T14:15:47Z",
 		@details="https://api.convertkit.com/forms/4812558?k=xxx&v=2",
 		@embed="https://api.convertkit.com/forms/4812558/embed?k=xxx&v=2",
 		@id=481,
 		@name="10 days to a better gem",
 		@subscriber_count=4,
 		@updated_at="2014-12-12T13:26:14Z">

## Subscribe to a form

	form = client.form(4)
	form.subscribe(email: "email@email.com", fname: "name", course_opted: true)

## Form details

	form = client.form(4)

## Get Courses

	courses = client.courses

## Get Course Details

	course = client.courses(4)




## Contributing

1. Fork it ( https://github.com/stevencorona/convertkit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
