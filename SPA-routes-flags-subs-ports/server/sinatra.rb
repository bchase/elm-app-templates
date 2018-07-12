#!/usr/bin/env ruby

require 'sinatra'


set :port, ENV['PORT'] || 8080

get '*/elm.js' do |_|
  send_file 'dist/elm.js'
end

get '*' do |_|
  send_file 'dist/index.html'
end
