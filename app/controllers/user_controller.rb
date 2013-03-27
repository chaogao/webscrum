class UserController < ApplicationController
	before_filter :authorize_redirect, :only => ["login", "registe"]
	

	def login
		if params[:code]
			@token = $client.auth_code.get_token(params[:code].to_s)
			p @token
			@friends = JSON.parse(@token.post('https://api.renren.com/restserver.do', :params => {:method => 'photos.getAlbums', :format => 'JSON', :uid => @token.params["user"]["id"]}).body)
			p @friends
		else
			@authorize_url = $client.authorize_url({:scope => 'read_user_album'})
		end

		#hanlder login form
		if request.post?
			user = User.auth_login(params[:email], params[:password])

			if user
				session[:user_id] = user
				redirect_to :controller => "home", :action => "groups"
			else
				flash[:error] = "Invalid User"
			end
		end
	end

	#user logout
	def logout
		session[:user_id] = nil
		session[:group] = nil
		redirect_to :controller => 'home'
	end

	#registe an user
	def registe
		if request.post?
			@user = User.new(params[:user]);
			if @user.save
				session[:user_id] = @user
				redirect_to :controller => 'home', :action => 'index'
			else
				render :action => 'registe'
			end
		else
			@user = User.new
		end
	end

end