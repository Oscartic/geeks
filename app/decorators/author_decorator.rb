class AuthorDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  # Decorador para servir el nombre y apellido en las vista de Author:
  def title
    h.content_tag(:h1, [first_name, last_name.upcase].join(' '))
  end

end
