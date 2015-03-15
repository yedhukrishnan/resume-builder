
namespace :resume do

	desc "Build resume"

	task :build do
		require 'yaml'
		require 'erb'

		begin
			Dir.mkdir("resume") unless Dir.exists?("resume")
			Dir.mkdir("resume/css") unless Dir.exists?("resume/css")
			Dir.mkdir("resume/img") unless Dir.exists?("resume/img")

			@config = YAML.load_file "config/resume.yml"
			@resume = ERB.new File.open("templates/1/resume.erb").read
			File.write "resume/index.html", @resume.result

			sh "cp templates/1/css/resume.css resume/css"
			sh "cp templates/bootstrap/bootstrap.min.css resume/css"
			sh "cp config/profile.jpg resume/img"

			puts ""
			puts "Resume created successfully. See 'resume/index.html'"
		rescue Exception => e
			puts "Error: #{e}"
		end
	end

end
