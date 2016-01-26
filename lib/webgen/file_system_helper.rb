class FileSystemHelper

  def output_ascii
    text = File.open('../resources/webgen_ascii.txt').read
    text.each_line do  |line|
      puts line
    end
  end

  def check_configs(config_locations)
    config_locations.each do |config|
      if File.exist?(config)
        puts config + ' exists'
      else
        puts config + ' is missing!'
      end
    end

  end

end