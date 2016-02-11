class HashHelper
  def create_site_hash(template_id, template_description, template_root, vulnerabilities)
    hash = {
        template_id => {
            :template_description => template_description,
            :template_root => template_root,
            :vulnerabilities => []
        }
    }

    return hash
  end

end