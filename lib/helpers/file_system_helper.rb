class FileSystemHelper

  def output_ascii
    text = File.open('../resources/webgen_ascii.txt').read
    text.each_line do  |line|
      puts line
    end
  end

  def check_configs(config_locations)
    configs_are_present = true
    config_locations.each do |name, value|
      if File.exist?(value)
        puts name.to_s + ' exists'
      else
        puts name.to_s + ' is missing!'
        configs_are_present = false
      end

      if configs_are_present
        #exit gracefully
      end


    end

  end

end