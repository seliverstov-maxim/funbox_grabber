require_relative 'src_grabber'

class GrabberController
  attr_accessor :img_loader, :src_grabber

  def initialize(img_loader)
    @img_loader = img_loader
    @src_grabber = SrcGrabber
  end

  def load_images(url, dir)
    return false if url.empty?
    return false if dir.empty?
    return false unless Dir.exists?(dir)

    src_collection = @src_grabber.new(url).src_collection
    @img_loader.new(dir).load(src_collection)
  end
end
