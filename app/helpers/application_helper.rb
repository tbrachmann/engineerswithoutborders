module ApplicationHelper
    
  def full_title(page_title = '')
    base_title = "Engineers Without Borders"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, :sort => column, :direction => direction
  end
 
end
