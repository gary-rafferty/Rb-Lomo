# Rb::Lomo

This is a v1 Ruby wrapper for most of the lomography.com API.


## Installation

Add this line to your application's Gemfile:

    gem 'rb-lomo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rb-lomo

## Usage

### Instantiate the client using your API-KEY

```ruby
client = Rb::Lomo::Client.new('YOUR-API-KEY')
```

Currently, you need to request an API key from Lomography.
Emailing markus@lomography.com should hook you up with one.

### Call methods on the client

```ruby
client.popular_photos.last.user.username

client.popular_photos.last.small_asset_url

client.cameras.last

client.popular_camera_photos(3314883).last

client.recent_camera_photos(3314883).last

client.recent_photos.first

client.selected_photos.last

client.films.last

client.popular_film_photos(871911028).last

client.recent_film_photos(871911028).last
```

## Testing

I've wrote up some tests using MiniTest.
Currently, you need to stick your API key into each test class as a
request is made to the api each time.
This could probably be mocked but I tend to prefer making the actual
request if its only for a small amount of times.

## Todo

Build a sample application to show the gem usage.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
