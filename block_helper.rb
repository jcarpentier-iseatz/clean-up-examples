# instead of

def do_hotel_stars(rating, lit_star = nil, dim_star = nil)
  lit_star ||= content_tag(:span, '&nbsp;', :class => 'yellow_star')
  dim_star ||= content_tag(:span, '&nbsp;', :class => 'grey_star')
  
  buff = ""
  rating.times { buff += lit_star }
  (5 - rating).times { buff += dim_star }
  buff
end


# or


=begin

 <%
  rating = 0 if (!rating || rating > 5)
-%>
<% if rating == 0 -%>
<span class="rating">(Not Rated)</span>
<% else -%>
<span class="rating"><% rating.to_i.times do %><%= image_tag "/images/#{@partner.skin_shared_path}/star-active.gif", :alt => '' %><% end -%>
<% (5 - rating.to_i).times do %><%= image_tag "/images/#{@partner.skin_shared_path}/star-off.gif",  :alt => '' %><% end -%></span>
<% end -%>

=end





# pass this a block with the html you want to use to render the stars, for example:
#
# <% hotel_star_rating(hotel.rating) do |star| %>
#   <%= image_tag "/images/klm/icon-star_#{star}.gif", :width => 12, :height => 12 %>
# <% end %>
def hotel_star_rating(rating, total_stars = 5)
  rating.times { yield(:on) }
  (total_stars - rating).times { yield(:off) }
end
