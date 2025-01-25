require 'net/http'

def post_request(url, body_params)
    uri = URI(url)
    res = Net::HTTP.post_form(uri, body_params)

    print "Response status: #{res.code} #{res.message}\n"

    print "Response body:\n#{res.body.chomp}"
end