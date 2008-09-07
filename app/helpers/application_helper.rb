# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def alphabetical_query_list(query)
    li = link_to_unless query.blank?, "All"
    list = [content_tag(:li, li)]
    "A".upto("Z") do |l|
      li = link_to_unless l == query, l, :q => l
      list.push(content_tag(:li, li)) 
    end
    content_tag :ul, list.join("\n"), :class => "alphabetical"
  end
end
