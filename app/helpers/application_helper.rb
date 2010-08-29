# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sample_with_more(body, html_options = {})
    more_link = link_to_function(" More...", "$('more').hide(); $('hidden').show();', :id => 'more'")


    content_tag(:div, html_options) do 
      body[0..100] + more_link +
        content_tag(:span, body[100..-1], :style => "display:none", :id => "hidden")
    end
  end
end
