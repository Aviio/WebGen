#contains methods that allow xml > hash conversion.
require 'xmlsimple'
class XmlHelper

  #todo: unit test this
  #todo: add seperate converters for each type of configuration, this needs to be done so that the keyattr can be set differently
  def xml_to_hash(config_location)
      if File.exist? config_location
        return XmlSimple.xml_in(config_location, { 'KeyAttr' => 'templateId' })
      else
         puts "#{config_location} does not exist"
      end

  end

end