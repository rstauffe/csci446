#!/usr/bin/ruby

require 'rack'
require 'csv'
require_relative 'book'

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
		@time = Time.now
    @booklist = []
    rank = 1
    CSV.foreach("books.csv") do |row|
      @booklist << Book.new(row[0].strip, row[1].strip, row[2].strip, row[3].strip, row[4].strip, rank)
      rank += 1
    end
	end
  
  def sortlist(param)
    case param
      when "title"
        @booklist.sort!{|x,y| x.title <=> y.title}
      when "author"
        @booklist.sort!{|x,y| x.author <=> y.author}
      when "language"
        @booklist.sort!{|x,y| x.language <=> y.language}
      when "year"
        @booklist.sort!{|x,y| x.year <=> y.year}
    end
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
        render_booklist(request, response)
      else
        render_bookform(request, response)
      end	# end case
      
      response.write("<br/>\n<footer>Brought to you by: Some Guy in a Basement</footer>\n")
      response.finish
    end

  def render_bookform(req, response)
    response.write("<form action=\"/booklist\">\n")
    response.write("<select name=\"sort\">\n")
    response.write("<option value=\"title\">Title</option>\n")
    response.write("<option value=\"author\">Author</option>\n")
    response.write("<option value=\"language\">Language</option>\n")
    response.write("<option value=\"year\">Year</option>\n")
    response.write("</select>\n")
    response.write("<input type=\"submit\" value =\"Display List\">\n")
    response.write("</form>\n")
  end
  
  def render_booklist(req, response)
    sortlist(req.GET["sort"])
    response.write("<table border=\"1\">\n")
    response.write("<tr>\n")
    response.write("<th>Rank</th>\n")
    response.write("<th>Title</th>\n")
    response.write("<th>Author</th>\n")
    response.write("<th>Language</th>\n")
    response.write("<th>Year</th>\n")
    response.write("<th>Copies</th>\n")
    response.write("</tr>\n")
    
    # header
    @booklist.each do |book|
      response.write("<tr>\n")
      response.write("<td>#{book.rank}</td>\n")
      response.write("<td>#{book.title}</td>\n")
      response.write("<td>#{book.author}</td>\n")
      response.write("<td>#{book.language}</td>\n")
      response.write("<td>#{book.year}</td>\n")
      response.write("<td>#{book.copies}</td>\n")
      response.write("</tr>\n")
    end
    response.write("</table>\n")
  end
end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
