require 'minitest/autorun'
require_relative '../../lib/helpers/hash_helper'

class HashHelperTests < MiniTest::Test
  def setup
    @sut = HashHelper.new
  end

  def test_create_empty_site_hash_should_return_empty_site_hash
    #arrange
    template_id = '1'
    template_description = 'A description'
    template_root = 'A site root'
    vulnerabilities = []

    #act
    result = @sut.create_site_hash(template_id, template_description, template_root, vulnerabilities)

    #assert
    assert(result.is_a?(Hash))
    assert(result['1'].has_key?(:template_description), msg = 'site hash doesnt contain a description key')
    assert(result['1'].has_key?(:template_root), msg = 'site hash doesnt contain a template root key')
    assert(result['1'].has_key?(:vulnerabilities), msg = 'site hash doesnt contain a vulnerability key')
    assert(result['1'][:vulnerabilities].is_a?(Array), msg = 'vulnerabilities is not an array')
    assert(result['1'][:template_root] == 'A site root')
    assert(result['1'][:template_description] == 'A description')
  end
end