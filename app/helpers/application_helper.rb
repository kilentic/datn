module ApplicationHelper
  def full_title page_title=""
    base_title = "Cinema House"
    if page_title.empty?
      base_title 
    else
      page_title + " | " + base_title
    end
  end

  def error_element_id error_key 
    controller.controller_name + "-" + 
      error_key.to_s.split('_').join('-') + "-error"
  end
end
