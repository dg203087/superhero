#CLI Controller responsible for user interactions
class Superhero::CLI  

    def call
        list_superheroes
        menu
        goodbye
    end

    def list_superheroes #will really GET deals when using API
        puts "Welcome Superheroes!" 
        @superheroes = Superhero::Hero.shazam
        @superheroes.each_with_index(1) do |hero, i|
            puts "#{i}. #{hero.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the superhero you'd like to learn about. 
            Type list to see the names again. Type exit to leave."
            input = gets.strip

            # Superhero::API.query_superhero_db(input)
            
            if input.to_i > 0 
                the_hero = @superheroes[input.to_i - 1]
                puts "#{the_hero.name} - #{the_hero.power} - #{the_hero.appearance}"
            elsif input == "list"
                list_superheroes
            else
                puts "Not sure what you want, type list or exit."
            end
        end
    end

    def goodbye
        puts "See you soon Superhero!"
    end
end