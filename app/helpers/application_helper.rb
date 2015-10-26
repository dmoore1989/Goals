module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
      <input type="hidden"
          name="authenticity_token"
          value="#{form_authenticity_token}"
          >
    HTML
  end

  def public_goals(user)
    user.goals.where(private: false)
  end

  def private_goals(user)
    user.goals.where(private:true)
  end


end
