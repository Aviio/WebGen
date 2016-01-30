class FileSystemHelper

  def output_ascii
    text = File.open('../resources/webgen_ascii.txt').read
    text.each_line do  |line|
      puts line
    end
  end

  def check_configs(config_locations)
    config_locations.each do |name, value|
      if File.exist?(value)
        puts name.to_s + ' exists'
      else
        puts name.to_s + ' is missing!'
      end
    end

  end

end