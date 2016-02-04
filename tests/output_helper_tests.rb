require 'minitest/autorun'
require_relative '../lib/helpers/output_helper'

class OutputHelperTests < Minitest::Test
  def setup
    @sut = OutputHelper.new
  end
  def test_one_site_returns_correct_output
    #arrange

    sites_hash = {
        "Site"=>[
            {"TemplateId"=>["1"],
             "Description"=>["A simple blogging platform"],
             "Vulnerabilities"=>[
                 {"Vulnerability"=>[
                     {"Id"=>["sql-1"],
                      "Description"=>["A SQL Injection based vulnerability using string concatenation"]
                     }]}]}]}

    #act
    assert_output(/There is 1 site defined in the sites config/) {@sut.count_sites(sites_hash)}

  end

  def test_two_sites_returns_correct_output
    #arrange
    sites_hash= {
        "Site"=>[
        {"TemplateId"=>["1"],
         "Description"=>["A simple blogging platform"],
         "Vulnerabilities"=>[
             {"Vulnerability"=>[
                 {"Id"=>["sql-1"],
                  "Description"=>["A SQL Injection based vulnerability using string concatenation"]}]}]},

        {"TemplateId"=>["2"],
         "Description"=>["A simple blogging platform"],
         "Vulnerabilities"=>[
             {"Vulnerability"=>[
                 {"Id"=>["sql-1"],
                  "Description"=>["A SQL Injection based vulnerability using string concatenation"]}]}]}]}


    #act
    assert_output(/There are 2 sites defined in the sites config/) {@sut.count_sites(sites_hash)}

  end
end