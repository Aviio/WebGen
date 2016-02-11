class SiteRandomizer
  def generate_random(template_definitions_hash, vulnerability_definitions_hash)
    number_of_templates = template_definitions_hash['template'].size
    random_number = rand(1..number_of_templates)
    puts random_number
    selected_template = template_definitions_hash['template'][random_number - 1]
    puts selected_template
    #get maximum number of vulnerabilities that can be paired with the selected template
    max_number_vulnerabilities = selected_template['vulnerability'].count
    puts max_number_vulnerabilities
    number_of_vulnerabilities = rand(1..max_number_vulnerabilities)
    #pick number of vulnerabilities from vulnerabilities list randomly
    #match the vulnerability id's on that template to ones in vuln defs

    #if the random number is equal to the max number of vulns, put them all in
    if number_of_vulnerabilities == max_number_vulnerabilities

    end

    #create site hash
    #pass to generate specified
  end
end