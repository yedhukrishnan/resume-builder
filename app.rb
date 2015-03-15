require 'sinatra'
require 'erb'
require 'yaml'

get "/" do
	@config = YAML.load_file("resume.yml") 
	erb :resume
end
