
require 'flickraw'
require 'awesome_print'


FlickRaw.api_key="f4b1ce80af46485e18c007222f6f725b"
FlickRaw.shared_secret="c4461182866476c2"

list = flickr.photos.search :text => "FC Barcelona", :sort => "relevance"

ap list
photos = list.map do |i|
    "https:/farm3.static.flickr.com/#{i["server"]}/" "#{i["id"]}_" "#{i["secret"]}_n.jpg"
end

ap photos.sample

