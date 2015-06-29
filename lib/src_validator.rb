class SrcValicator
  def self.valid?(src)
    return false if src.nil? || src.empty?

    uri = URI(src)
    return false if uri.path.empty?
    return false if uri.scheme.nil?
    true
  end
end
