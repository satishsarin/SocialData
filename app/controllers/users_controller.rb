require 'fetch_social_data'

class UsersController < ApplicationController 
	
	def index
		@username = params[:username].strip if params[:username]
		if request.post?
			@tweets_fetch_from_twitter = FetchSocialData::TweetsFetchFromTwitter.fetch_tweets_data(@username)
			@fetch_git_details = FetchSocialData::FetchGithubData.fetch_user_info(@username)
			@rubygems_details = FetchSocialData::FetchInfoFromRubyGems.fetch_rubygems_details(@username)
		end	
		respond_to do |format|
      format.html
      format.pdf do
        render :pdf =>"#{@username} Social Data", :template => 'users/index.pdf.erb', :disposition => 'attachment', :layout => false, :encoding => "utf8"
      end
    end
	end	

end