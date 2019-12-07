class Superhero::CLI  

    def call
        puts ""
        puts " Welcome to Superhero Finder!"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        menu
    end

    def menu
        puts ""
        puts "What would you like to do?"
            sleep 1
        puts "Type 'list' to see the list of popular superheroes."  
            sleep 1
        puts "Type 'alpha' to view a list of superheroes by letter"  
            sleep 1
        puts "Or you can type exit to leave."
        
        input = gets.strip
            
        if input == "exit"
            goodbye
        elsif input == "list"
            list_superheroes
        elsif input == "alpha"
            list_by_alpha
        else 
            puts "Not sure what you want, let's try again."
            menu
        end
    end

    def list_superheroes
        Superhero::API.create_popular_superheroes
        puts "   Popular Superheroes List"
        puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
        Superhero::Hero.all.each.with_index(1) do |hero_name, i|
            puts "#{i}. #{hero_name.name.gsub('_', ' ')}"
        end
        search_from_popular_list
    end

    def search_from_popular_list
            puts "Enter the number of the superhero from the list you'd like to learn more about:" 
            puts "Type 'menu' to go back to the main menu."
            puts "Or type exit to leave."
            input = gets.strip

        if input.to_i >= 1 && input.to_i <= 25 
            @attribute = Superhero::Hero.all[input.to_i - 1]
            display_info
            again?
        elsif input == "menu"
            Superhero::Hero.clear
            menu
        elsif input == "exit"
            goodbye
        else 
            puts "Input not valid, try again."
            search_from_popular_list
        end
    
    end

    def list_by_alpha
        puts "Enter the letter you'd like to search."
        puts "Or type exit to leave."
        letter = gets.strip.downcase
    
        if letter == "exit"
            goodbye
        elsif ("a".."z").include?(letter)
            puts "      Superheroes & Villains: The #{letter.upcase} List"
            puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
            case letter
            when "a"
                Superhero::API.create_alpha_list("1".."59")
            when "b"
                Superhero::API.create_alpha_list("60".."144")
            when "c"
                Superhero::API.create_alpha_list("145".."197")
            when "d"
                Superhero::API.create_alpha_list("198".."234")
            when "e"
                Superhero::API.create_alpha_list("235".."249")
            when "f"
                Superhero::API.create_alpha_list("250".."272")
            when "g"
                Superhero::API.create_alpha_list("273".."305")
            when "h"
                Superhero::API.create_alpha_list("306".."338")
            when "i"
                Superhero::API.create_alpha_list("339".."348")
            when "j"
                Superhero::API.create_alpha_list("349".."377")
            when "k"
                Superhero::API.create_alpha_list("378".."398")
            when "l"
                Superhero::API.create_alpha_list("399".."420")
            when "m"
                Superhero::API.create_alpha_list("421".."480")
            when "n"
                Superhero::API.create_alpha_list("481".."497")
            when "o"
                Superhero::API.create_alpha_list("498".."508")
            when "p"
                Superhero::API.create_alpha_list("509".."532")
            when "q"
                Superhero::API.create_alpha_list("533".."537")
            when "r"
                Superhero::API.create_alpha_list("538".."569")
            when "s"
                Superhero::API.create_alpha_list("570".."648")
            when "t"
                Superhero::API.create_alpha_list("649".."678")
            when "u"
                Superhero::API.create_alpha_list("679".."681")
            when "v"
                Superhero::API.create_alpha_list("682".."701")
            when "w"
                Superhero::API.create_alpha_list("702".."722")
            when "x"
                Superhero::API.create_alpha_list("723".."724")
            when "y"
                Superhero::API.create_alpha_list("725".."729")
            when "z"
                Superhero::API.create_alpha_list("730".."731")
            end

            Superhero::Hero.all.each.with_index(1) do |hero_name, i| 
                puts "#{i}. #{hero_name.name.gsub('_', ' ')}"
            end
            search_from_alpha_list
        else
            puts "Something's not right, try again."
            list_by_alpha
        end
    end

    def search_from_alpha_list
        puts "Select a number to learn more about a hero from the list"
        puts "Type 'menu' to go back to the main menu."
        puts "Or type exit to leave."
        input = gets.strip

        if input.to_i >= 1 && input.to_i <= Superhero::Hero.all.count
            @attribute = Superhero::Hero.all[input.to_i - 1]
            display_info
            again_alpha_list?
        elsif input == "menu"
            Superhero::Hero.clear
            menu 
        elsif input == "exit"
            goodbye
        else 
            puts "That's not a valid number, try again."
            search_from_alpha_list
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

    def again?
        puts "Would you like to learn about another superhero from this list?  y/n"
        input = gets.strip.downcase
        if input == "y" || input == "yes"
            search_from_popular_list
        elsif input == "n" || input == "no"
            Superhero::Hero.clear
            menu
        else
            puts ""
            puts "Not sure what you're trying to say, let's try again."
            puts ""
            menu
        end
    end

    def again_alpha_list?
        puts "Would you like to learn about another superhero from this list?  y/n"
        input = gets.strip.downcase
        if input == "y" || input == "yes"
            search_from_alpha_list
        elsif input == "n" || input == "no"
            Superhero::Hero.clear
            puts "Would you like to search a different letter? y/n"
            input = gets.strip.downcase
            if input == "y" || input == "yes"
                list_by_alpha
            elsif input == "n" || input == "no"
                menu
            else
                puts ""
                puts "Not sure what you're trying to say, let's try again."
                puts ""
                menu
            end
        else
            puts ""
            puts "Not sure what you're trying to say, let's try again."
            puts ""
            menu
        end
    end

    def goodbye
        puts ""
        puts "Off to another adventure! See you soon Superhero!"
    end
end