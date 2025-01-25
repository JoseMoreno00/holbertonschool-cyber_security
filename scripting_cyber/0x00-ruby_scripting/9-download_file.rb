require 'open-uri'
require 'uri'
require 'fileutils'

def download_file(url, path)
    if url.nil? || path.nil?
        puts "Usage: 9-download.rb URL LOCAL_FILE_PATH"
        return
    end

    FileUtils.mkdir_p(File.dirname(path))
    puts "Downloading file from #{url}..."
    URI.open(url) do |file|
        File.open(path, 'wb') do |out_file|
            out_file.write(file.read)
        end
    end
    puts "File downloaded and saved to #{path}"
end

if ARGV.length != 2
    puts "Usage: 9-download.rb URL LOCAL_FILE_PATH"
else
    url = ARGV[0]
    path = ARGV[1]
    download(url, path)
end