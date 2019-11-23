class Superhero::API
    BASE_URL = "https://superheroapi.com/api.php/"
    ACCESS_TOKEN = "814865975490"
    #should be saved in an environment and not hard coded

    def self.query_superhero_db(input)
        # input = gets.strip
        # input = input.downcase.tr(" ","_") #make URL friendly parameterize
        results = HTTParty.get("#{BASE_URL}#{ACCESS_TOKEN}/search/#{input}")

        Superhero::Hero.new(results)
    end
end