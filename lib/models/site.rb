class Site
  attr_accessor :template_id, :url, :vulnerabilities
  def initialize
    @template_id = template_id
    @url = url
    @vulnerabilities = []
  end
end