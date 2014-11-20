require 'sinatra'
require_relative "life_for_site.rb"

 
set :public_folder, File.dirname(__FILE__) + '/static'
	
	@@a = Life_for_site.new
	@@n = 10
	@@m = 10
	@@life_map = @@a.start_life(@@n,@@m)
	@@gen = 0
	@@life_prev = []

get '/', :provides => 'html' do 
	erb :site
end

get '/game_over' do
	erb :game
end

post '/' do
	@@n = params[:n_count].to_i
	@@m = params[:m_count].to_i
	@@life_map = @@a.start_life(@@n,@@m)
	erb :site
end

post '/life' do
	@@life_map = @@a.next_step()
	erb :site
end
