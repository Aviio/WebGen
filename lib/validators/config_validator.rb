#Validates configuration file locations and configuration contents
class ConfigValidator

  def initialize(output_helper)
    @output_helper = output_helper
  end

  def validate_config_locations(config_locations)
      configs_are_present = true

      #make sure config locations have configs present
      puts "\n---------------------------------\n"
      puts "Checking WebGen Configurations:\n\n"
      config_locations.each do |name, value|
        if File.exist?(value)
         puts name.to_s + ' exists'
        else
          puts name.to_s + ' is missing!'
          configs_are_present = false
        end

      end
      puts "\n---------------------------------\n"
      configs_are_present
    end
end