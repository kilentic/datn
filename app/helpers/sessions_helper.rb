module SessionsHelper
  def current_visitor 
    if visitor_id = session[:visitor_id]
      @current_visitor = Visitor.find_by id: visitor_id 
    elsif visitor_id = cookies.signed[:visitor_id]
      visitor = Visitor.find_by id: visitor_id 
      if visitor && visitor.authenticate?(:remember, cookies[:remember_token])
        login visitor 
        @current_visitor = visitor
      end
    end
  end

  def current_refer 
    @current_refer = current_visitor.refer 
  end

  def log_in visitor
    session[:visitor_id] = visitor.id   
  end
  
  def log_out visitor 
    forget curent_visitor 
    session.delete[:visitor_id]
    @current_visitor = nil 
    @current_refer = nil
  end 

  def logged_in?
    current_visitor.present?  
  end

  def remember visitor 
    visitor.remember 
    cookies.permanent.signed[:visitor_id] = visitor.id 
    cookies.permanent[:remember_token] = visitor.remember_token
  end 

  def forget visitor 
    visitor.forget 
    cookies.delete :visitor_id 
    cookies.delete :remember_token
  end
end
