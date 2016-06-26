require 'sinatra'
require 'net/http'

STREAM_URI = URI('https://cpc-curz-app.herokuapp.com/play')

post '/say' do
  if params['token'] == ENV['SLACK_VERIFICATION_TOKEN']
    Net::HTTP.post_form(STREAM_URI, 'text' => params['text'])
  end
  return "Saying: #{params['text']}"
end
