module ApplicationHelper
  def current_page(page_icon)
    @page == page_icon
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, '', :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\");return false;")
  end

  def markdown(text)
    options = {
      filter_html: false,
      hard_wrap: true,
      #link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      tables: true,
      disable_indented_code_blocks: true
    }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)


    markdown.render(text).html_safe
  end
end
