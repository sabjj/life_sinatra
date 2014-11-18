require 'sinatra'
require 'life_for_site'

 
set :public_folder, File.dirname(__FILE__) + '/static'

get '/life', :provides => 'html' do 
	@a = Life_for_site.new
	@n = 10
	@m = 10
	erb :site
end