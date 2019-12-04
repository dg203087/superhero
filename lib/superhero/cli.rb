class Superhero::CLI  

    def call
        puts " Welcome to Superhero Finder!"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        puts ""
        Superhero::API.create_popular_superheroes
        list_superheroes
        menu
    end

    def list_superheroes
        puts "   Popular Superheroes List"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        Superhero::Hero.all.each.with_index(1) do |hero_name, i| #iterates over @@all array
            puts "#{i}. #{hero_name.name.gsub('_', ' ')}"
        end
    end

    def menu
        puts ""
        puts "Enter the number of the superhero from the list you'd like to learn more about:" 
        puts "Type 'list' to see the list again."
        puts "Or you can type exit to leave."
        input = gets.strip
            
        if input == "exit"
            goodbye

        elsif input == "list"
            list_superheroes
            menu

        elsif input.to_i >= 1 && input.to_i <= 25 
            @attribute = Superhero::Hero.all[input.to_i - 1]
            #instance variable set equal all initialized objects to be called below
            display_info

            puts "Would you like to learn about another superhero? y/n"
            input = gets.strip.downcase
            if input == "y"
                menu
            elsif input == "n"
                goodbye
            else
                puts ""
                puts "Not sure what you're trying to say, let's try again."
                puts ""
                menu
            end
        else 
            puts "I don't know that superhero, try again."
            puts "Or type exit to leave."
            menu
        end
    end

    def display_info 
        puts "------------- #{@attribute.name}'s Profile -------------"
        puts ""
        puts "Full Name:           #{@attribute.full_name}"
        puts "Race:                #{@attribute.race}"
        puts "Alignment:           #{@attribute.alignment}"
        puts "Home Base:           #{@attribute.home_base}"
        puts "Publisher:           #{@attribute.publisher}"
        puts ""
        puts "---------------- Power Stats ----------------"
        puts ""
        puts "Intelligence:        #{@attribute.intelligence}"
        puts "Strength:            #{@attribute.strength}"
        puts "Speed:               #{@attribute.speed}"
        puts "Durability:          #{@attribute.durability}"
        puts "Power:               #{@attribute.power}"
        puts "Combat:              #{@attribute.combat}"
        puts ""
    end

    def goodbye
        puts ""
        puts "Off to another adventure! See you soon Superhero!"
    end
end