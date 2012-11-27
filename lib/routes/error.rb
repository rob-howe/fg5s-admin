require "sinatra/base"

class FivesController < Sinatra::Base

  # same as:   error 404
  not_found do
    puts "Page not found: #{request.path}"
    erb :error_404
  end

  error 500 do
    if request.env['sinatra.error'].nil?
      puts "Server error for path: #{request.path}, showing 500 page :( - no sinatra.error"
    else
      puts "Server error for path: #{request.path}, showing 500 page :( error name: #{request.env['sinatra.error'].name} message: #{request.env['sinatra.error'].message}"
    end
    erb :error
  end

end

