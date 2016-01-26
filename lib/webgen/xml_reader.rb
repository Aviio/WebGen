# Responsible for taking in an xml configuration and converting to an object that webgen_engine can use

class XmlReader
  def get_system_config
     File.open(SYSTEM_CONFIG_LOCATION) { |f| Nokogiri::XML(f) }
  end

end