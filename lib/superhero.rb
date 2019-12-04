#Environment 
require 'httparty'
require 'pry'

require_relative './superhero/version'
require_relative './superhero/hero'
require_relative './superhero/cli'
require_relative "./superhero/api"

#API Call 
BASE_URL = "https://superheroapi.com/api.php/"
ACCESS_TOKEN = "814865975490"