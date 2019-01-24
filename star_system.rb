require ('pry')

class StarSystem
  attr_reader :name, :planets

    def initialize(name, planets)
      @name = name
      @planets = planets
    end

    def planet_names
      planet_names = []
      @planets.each do |planet|
        planet_names << planet.name
      end
      return planet_names
    end

    def get_planet_by_name(planet_name)
      for planet in @planets
        if planet.name == planet_name
          return planet
        end
      end
    end

    def get_largest_planet
      max_planet = @planets.sort { |x, y| y.diameter <=> x.diameter }
      return max_planet[0]
    end


    def get_smallest_planet
      min_planet = @planets.sort { |x, y| x.diameter <=> y.diameter }
      return min_planet[0]

      # planet_sizes = @planets.map { |planet|
      #   planet.diameter
      # }
      #
      # smallest_planet = planet_sizes.min
      #
      # planets.each do |planet|
      #   if planet.diameter == smallest_planet
      #     return planet
      #   end
      # end
    end

    def get_planets_with_no_moons
      no_moon_planets = @planets.find_all { |planet|
        planet.number_of_moons == 0
      }
      return no_moon_planets
    end

    def get_planets_with_more_moons(num_of_moons)
      plus_four_moon_planets = @planets.find_all { |planet|
        planet.number_of_moons > num_of_moons
      }
      return plus_four_moon_planets.map { |planet|
        planet.name
      }
    end

    def get_number_of_planets_closer_than(num)
      greater_distance = @planets.find_all { |planet|
        planet.distance_from_sun < num
      }
      return greater_distance.length
    end

    def get_total_number_of_moons
      return @planets.reduce(0) { |total, planet|
        total + planet.number_of_moons
      }
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
      sorted_planets = @planets.sort { |x, y| x.distance_from_sun <=> y.distance_from_sun}
      p sorted_planets

      return sorted_planets.map { |planet| planet.name }
    end

    def get_planet_names_sorted_by_size_decreasing
      sorted_planets = @planets.sort { |x, y| y.diameter <=> x.diameter}
      p sorted_planets

      return sorted_planets.map { |planet| planet.name }
    end


end
