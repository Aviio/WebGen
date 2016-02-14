class SiteRandomizer
  def generate_random(template_definitions_hash, vulnerability_definitions_hash)
    number_of_templates = template_definitions_hash['template'].size
    #get random number to select by id from template definitions
    random_number = rand(1..number_of_templates)
    selected_template = template_definitions_hash['template'][random_number - 1]
    puts "I have selected template number #{selected_template['id']}"
    puts "which looks like #{selected_template}"
    puts "which is #{selected_template['description']}"
    puts 'and has the vulnerabilities:'
    puts
    selected_template['vulnerability'].each{ |v| puts v}
    #get maximum number of vulnerabilities that can be paired with the selected template
    puts
    max_number_vulnerabilities = selected_template['vulnerability'].count

    number_of_vulnerabilities = rand(1..max_number_vulnerabilities)
    puts "I am going to pick #{number_of_vulnerabilities} vulnerabilities"
    #pick number of vulnerabilities from vulnerabilities list randomly
    #match the vulnerability id's on that template to ones in vuln defs

    #vulnerability helper
    #if the random number is equal to the max number of vulns, put them all in
    if number_of_vulnerabilities == max_number_vulnerabilities
      puts 'I have selected all of the vulnerabilities possible for this template'
    end

    #create site hash
    #pass to generate specified
  end


end