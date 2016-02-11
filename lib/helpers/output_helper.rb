class OutputHelper

  def count_sites(sites_hash)
    puts sites_hash
    number_of_sites = sites_hash['site'].size
    if number_of_sites == 1
      puts "There is #{number_of_sites} site defined in the sites config"
    else
      puts "There are #{number_of_sites} sites defined in the sites config"
    end
  end

  def output_ascii
    text = File.open('../resources/webgen_ascii.txt').read
    text.each_line do  |line|
      puts line
    end
  end
end