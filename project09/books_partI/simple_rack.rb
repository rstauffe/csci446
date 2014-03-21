#!/usr/bin/ruby

require 'rack'
require 'ERB'
require 'sqlite3'
require 'csv'
require_relative 'book'

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
    @db = SQLite3::Database.new("books.sqlite3.db")
  end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
    # include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
    
		case env["PATH_INFO"]
      when /.*?\.css/
        # serve up a css file
        # remove leading /
        file = env["PATH_INFO"][1..-1]
        return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
      when /\/booklist.*/
        param=request.GET["sort"]
        (param="id")if(param=="rank")
        (param="published")if(param=="year")
        response.write(ERB.new(File.read("list.html.erb")).result(binding))
      else
        response.write(ERB.new(File.read("form.html.erb")).result(binding))
      end	# end case
      
      response.write("<br/>\n<footer>Brought to you by: Some Guy in a Basement</footer>\n")
      response.finish
    end
end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
