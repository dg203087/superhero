class Superhero::API

    def self.create_popular_superheroes
        popular_ids = ["70", "73", "75", "107", "149", "156", "165", "213", "263", "309", 
        "313", "346", "361", "487", "490", "536", "561", "567", "621", "644", "684", "714", 
        "720", "717", "729"]

        popular_ids.each do |hero_id|
            results = HTTParty.get("#{BASE_URL}#{ACCESS_TOKEN}/#{hero_id}")
            binding.pry
            name = results["name"]
            full_name = results["biography"]["full-name"]
            race = results["appearance"]["race"]
            alignment = results["biography"]["alignment"]
            home_base = results["work"]["base"]
            publisher = results["biography"]["publisher"]
            intelligence = results["powerstats"]["intelligence"]
            strength = results["powerstats"]["strength"]
            speed = results["powerstats"]["speed"]
            durability = results["powerstats"]["durability"]
            power = results["powerstats"]["power"]
            combat = results["powerstats"]["combat"]

            Superhero::Hero.new(name, full_name, race, alignment, home_base, publisher, intelligence, 
            strength, speed, durability, power, combat)
        end 
    end
end