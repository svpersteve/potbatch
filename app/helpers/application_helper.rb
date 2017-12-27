module ApplicationHelper
  def set_page_title(title)
    @page_title = title + ' | Pot Batch'
  end

  def set_page_description(description)
    @page_description = description
  end

  def instant_pot_link
    'http://amzn.to/2BZL1lL'
  end

  def tub_link
    'http://amzn.to/2BXUFoW'
  end
end
