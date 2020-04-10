require 'rubygems'
require 'bundler'

Bundler.require

require_relative './plant_search'
run Sinatra::PlantSearch
