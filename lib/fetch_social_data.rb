module FetchSocialData
	class FetchGithubData
		def self.fetch_user_info(username)
			info = {}
			begin	
			client = Octokit::Client.new(:client_id => "51d80114f08446bfe31e",:client_secret => "d28ffebe87d19b165d5877608e25c1a4cc0e555f")
			user = client.user username
			info[:doj] = user.created_at
			info[:repos_name] = user.rels[:repos].get.data.map(&:name)
			info
			rescue Exception => e
				puts e.message
			end
		end	
	end	

	class TweetsFetchFromTwitter
	  def self.fetch_tweets_data(username)
	    client = Twitter::REST::Client.new do |config|
	      config.consumer_key = "fsBghb30KhYuLqubjMjLw"
	      config.consumer_secret = "8a1Yuil5rcVfAh1lBk7icUCREocILJmEjP6eLWFc"
	      config.oauth_token = "1562302446-3jpqtHlukEM9RvE8iA5ORYQduU231tEpVH5CKgY"
	      config.oauth_token_secret = "uyhmgZSznKeJMGCtHN3TKE35zIeDRov22HGcwOzNnY"
	    end
	    client.user_timeline(username).map(&:text)[0..9]
	  end
  end

  class FetchInfoFromRubyGems
		def self.fetch_rubygems_details(username)
			info = {}
			begin
				base_url = "https://rubygems.org/api/v1/owners/#{username}/gems.json"
	    	response = HTTParty.get(base_url).parsed_response
	    	gems_name = []
	    	response.each do |res|
	    		gems_name << res["name"] if res["name"]
	    	end	
	    	info[:rubygems_name] = gems_name
	    	info
	    rescue Exception => e
	    	puts e.message
	    end	
  	end
  end	

end
