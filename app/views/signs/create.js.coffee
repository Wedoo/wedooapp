$template = $('#signInitiative')
$template.html("<div><%= escape_javascript(render 'form', sign: @sign) %></div>")
<% if @success %>
$template.find("input").attr("disabled", "disabled")
InitiativesModule.refresh_signs <%= @initiative.signs_count %>
<% end %>