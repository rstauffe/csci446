module CurrentSelection
  extend ActiveSupport::Concern
  
  private
  
  def set_selection
    @selection = Selection.find(session[:selection_id])
  rescue ActiveRecord::RecordNotFound
    @selection = Selection.create
    session[:selection_id] = @selection.id
  end
end