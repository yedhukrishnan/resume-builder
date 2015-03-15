
namespace :resume do

	desc "Build resume"
	task :build do
		require 'yaml'
		require 'erb'

		Dir.mkdir("resume") unless Dir.exists?("resume")
		Dir.mkdir("resume/css") unless Dir.exists?("resume/css")
		@config = YAML.load_file "resume.yml"
		@resume = ERB.new File.open("views/resume.erb").read
		File.write "resume/resume.html", @resume.result
		sh "cp views/template1/css/resume.css resume/css"
		sh "cp views/bootstrap/bootstrap.min.css resume/css"
	end

end
