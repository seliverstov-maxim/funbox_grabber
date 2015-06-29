require 'fileutils'
require './lib/grabber_controller'
require './lib/multi_thread_loader'

url = ARGV[0]
dir = ARGV[1]

FileUtils::mkdir_p dir

GrabberController.new(MultiThreadLoader).load_images(url, dir)
