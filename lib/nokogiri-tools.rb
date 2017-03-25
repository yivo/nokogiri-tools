# encoding: UTF-8
# frozen_string_literal: true

module NokogiriTools
  module CSS
    def css_properties
      "#{self['style']};".scan(/(\w[\w-]*\w):\s*([^;]+);/)
    end

    def css_properties=(properties)
      style = properties.map { |x| "#{x[0]}: #{x[1]}" }
      style.empty? ? delete('style') : self['style'] = style.join('; ')
    end

    def css_classes
      self['class'].to_s.split(/[[:blank:]]+/)
    end

    def css_classes=(classes)
      value = [classes]
      value.flatten!
      value.map!(&:squish)
      value.empty? ? delete('class') : self['class'] = value.join(' ')
    end
  end

  module Tree
    def remove_keeping_children
      children.each { |child| before(child) }
      remove
    end

    def remove_with_parent
      parent ? parent.remove : remove
    end
  end

  module Data
    def remove_data_attributes
      attributes.keys.each { |name| delete(name) if name.start_with?('data-') }
    end
  end
end

require 'nokogiri'
require 'unicode-tools'

Nokogiri::XML::Node.include NokogiriTools::CSS
Nokogiri::XML::Node.include NokogiriTools::Tree
Nokogiri::XML::Node.include NokogiriTools::Data
