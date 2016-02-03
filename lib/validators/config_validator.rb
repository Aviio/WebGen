class ConfigValidator

  def validate_config_locations(config_locations)
      configs_are_present = true
      puts 'Checking WebGen Configurations:'
      #make sure config locations have configs present
      puts
      puts '---------------------------------'
      puts
      config_locations.each do |name, value|
        if File.exist?(value)
          puts name.to_s + ' exists'
        else
          puts name.to_s + ' is missing!'
          configs_are_present = false
        end

      end
      configs_are_present
    end
end