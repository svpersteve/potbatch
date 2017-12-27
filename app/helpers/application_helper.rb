module ApplicationHelper
  def set_page_title(title)
    @page_title = title + ' | Pot Batch'
  end

  def set_page_description(description)
    @page_description = description
  end
end
