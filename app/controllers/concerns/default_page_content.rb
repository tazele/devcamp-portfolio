module DefaultPageContent
   extend ActiveSupport::Concern
  
  included do
    before_filter :set_title
  end
  

  def set_title
    @page_title = "Devcamp Portfolio |My portfolio website"
    @seo_keywords = "anastasia armstrong portfolio"
  end
end