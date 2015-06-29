require 'open-uri'
require 'thread'

class MultiThreadLoader
  def initialize(dir)
    @mutex = Mutex.new
    @thread_count = 16
    @direction_folder = dir
  end

  def load(url_collection)
    urls = url_collection.dup
    threads = []

    @thread_count.times do
      url = ''
      while urls.any? do
        @mutex.synchronize do
          url = urls.pop
        end

        name = url.split('/').last
        file_path = File.join(@direction_folder, name)
        File.write(file_path, source(url).read)
      end
    end
    threads.each(&:join)
  end

  private

  def source(url)
    open(url)
  end
end
