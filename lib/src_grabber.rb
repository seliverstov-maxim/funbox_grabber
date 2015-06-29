require 'nokogiri'
require 'open-uri'

require_relative 'src_validator'

class SrcGrabber
  def initialize(url)
    @page = Nokogiri::HTML(source_page(url))
  end

  def src_collection
    img_collection.map(&:attributes).map{ |e| e.fetch('src', nil).to_s }.select{ |e| SrcValicator::valid?(e) }
  end

  private

  def img_collection
    @page.css('img')
  end

  def source_page(url)
    open(url)
  end
end
