# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def logged_in?
    not session[:user_idd].nil?
  end
  
  def add_photo(form_builder)
  link_to_function "Add New Photo", :id  => "add_photo" do |page|
    form_builder.fields_for :photos, Photo.new, :child_index => 'NEW_RECORD' do |photo_form|
      html = render(:partial => 'photo', :locals => { :f => photo_form })
      page << "$('add_photo').insert({ before: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
    end
  end
end

def delete_photo(form_builder)
  if form_builder.object.new_record?
    link_to_function("Remove Photo", "this.up('fieldset').remove()")
  else
    form_builder.hidden_field(:_delete) +
    link_to_function("Remove Photo", "this.up('fieldset').hide(); $(this).previous().value = '1'")
  end
end

  
end
