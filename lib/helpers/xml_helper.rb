#contains methods that allow xml > hash conversion.
require 'xmlsimple'
class XmlHelper

  #todo: unit test this
  def xml_to_hash(config_location)
      if File.exist? config_location
        return XmlSimple.xml_in(config_location, { 'KeyAttr' => 'templateId' })
      else
         puts "#{config_location} does not exist"
      end

  end

end