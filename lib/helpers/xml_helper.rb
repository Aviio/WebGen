#contains methods that allow xml > hash conversion.
require 'xmlsimple'
class XmlHelper

  def xml_to_hash(config_location)
      #todo: add validation of config location presence
      XmlSimple.xml_in(config_location)
  end

end