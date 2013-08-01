module ApplicationHelper
  def full_title(page_title)
    base_title = "Douchey Shirts "
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def meta_data(title = '')
    response = {
      author: "doucheyshirts.com",
      description: "We are where to find funny #{title} shirts; also refered to as a inappropriate or offensive #{title} t-shirt by the less informed. Ok so maybe some are offensive, but everyone wants feels like a douche bag from time to time.",
      keywords: "t-shirts, shirts, tee shirts, tshirts, doucheyshirts.com, doucheyshirt.com, douchey shirts, douche, douche bag shirt, funny shirt, party shirt, drinking t-shirt, drinking shirts, offensive t-shirt, drinking t-shirt, nerdy shirt, geeky shirt, dirty t-shirt, nerdy t-shirt, nerdy shirts, funny shrit, #{title} shirt, #{title} t-shirt"
    }
  end
end
