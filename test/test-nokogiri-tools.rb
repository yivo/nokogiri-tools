# encoding: UTF-8
# frozen_string_literal: true

require 'test-unit'
require 'nokogiri-tools'

class NokogiriToolsTest < Test::Unit::TestCase
  def test_css_classes
    div = fragment('<div class="foo"></div>').children.first
    assert_equal %w( foo ), div.css_classes

    div.css_classes = %w( foo bar )
    assert_equal %w( foo bar ), div.css_classes
  end

  def test_css_styles
    div = fragment('<div style="color: #000; width: 100%;"></div>').children.first
    assert_equal [['color', '#000'], ['width', '100%']], div.css_properties

    div.css_properties = [['height', '100px'], ['color', 'red']]
    assert_equal [['height', '100px'], ['color', 'red']], div.css_properties
  end

  def test_data
    div = fragment('<div data-foo="foo" data-bar="bar">test</div>').children.first
    div.remove_data_attributes
    assert_equal '<div>test</div>', div.to_html
  end

  def test_parent_removal
    fragment = fragment('<div>1<div>2</div></div>')
    fragment.children.first.remove_keeping_children
    assert_equal '1<div>2</div>', fragment.to_html
  end

  def test_removal_including_parent
    fragment = fragment('<div><div>test</div></div>')
    fragment.children.first.children.first.remove_with_parent
    assert_equal '', fragment.to_html
  end

protected
  def fragment(html)
    Nokogiri::HTML.fragment(html) { |config| config.nonet.huge.nowarning.noerror }
  end
end
