class AddPostStatusToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :status, :integer, default: 0
  end
  
 def create
    @portfolio_item=Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
      respond_to do |format|
        if @portfolio_item.save
          format.html {redirect_to portfolios_path, notice: 'Your portfolio item is now live.'}
        else
          format.html { render :new }
        end
      end
  end
  
  def set_defautls
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
