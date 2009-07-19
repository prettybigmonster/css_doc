module CSSDoc
  class DocumentTemplate < Template
    def initialize(document, options = {})
      super(options)
      @document = document
    end

    def template_name
      'document'
    end
    
    def title
      @document.name
    end
    
    def relative_root
      if @document.name =~ /\//
        (['..'] * File.dirname(@document.name).split('/').size).join('/')
      else
        '.'
      end
    end
  end
end
