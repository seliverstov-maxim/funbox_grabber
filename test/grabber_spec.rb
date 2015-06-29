require './test/test_helper'
require 'grabber_controller'
require 'multi_thread_loader'
require 'fileutils'

RSpec.describe GrabberController do
  describe "#load_images" do
    let(:url) { 'some_url' }
    let(:dir) { './test_load' }

    before(:each) do
      FileUtils::mkdir_p dir
    end

    after(:each) do
      FileUtils::rm_rf dir
    end

    it "should load images" do
      expect_any_instance_of(SrcGrabber).to receive(:source_page){ open('./test/fixtures/test_source_page.html') }
      allow_any_instance_of(MultiThreadLoader).to receive(:source){ open('./test/fixtures/test.png') }

      GrabberController.new(MultiThreadLoader).load_images(url, dir)

      file_path = File.join(dir, 'some.png')
      expect(File).to exist(file_path)
    end
  end
end
