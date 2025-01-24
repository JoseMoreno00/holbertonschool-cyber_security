require 'net/http'
def get_request(url)
        uri = URI(url)
        res = Net::HTTP.get_response(uri)

        puts "Response status: #{res.code} #{res.message}"
        puts "Response body:\n#{'\n'res.body}"
end
