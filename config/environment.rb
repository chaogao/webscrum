# Load the rails application
require File.expand_path('../application', __FILE__)

require 'renren_oauth2'

# Initialize the rails application
Webscrum::Application.initialize!


RenRenOAuth2::Config.api_key = 229479

RenRenOAuth2::Config.api_sercert = '3f2e4f430cac4ad584b973bd6694233d'

RenRenOAuth2::Config.redirect_uri = 'http://www.mytest.com/user/login'

$client = RenRenOAuth2::Client.new('', '', :ssl => {:verify => false})