module Rake
  class CSSDocTask < TaskLib
    attr_accessor :input_dir
    attr_accessor :output_dir
    attr_accessor :skip_files
    attr_accessor :project_name
    attr_accessor :verbose
    attr_accessor :template_path
    
    def initialize(name = :css_doc)
      @name = name
      @input_dir = 'public/stylesheets'
      @output_dir = 'css_doc'
      @template_path = File.expand_path(File.dirname(__FILE__) + '/../templates/default')

      yield self if block_given?
      define
    end
    
    def define
      task @name do
        require 'css_doc'

        driver = CSSDoc::Driver.new
        driver.run(:project_name => self.project_name, :input_dir => self.input_dir, :output_dir => self.output_dir, :skip_files => self.skip_files, :verbose => self.verbose, :template_path => self.template_path)
      end
    end
  end
end
