class PicturesController < ApplicationController

def new_form
    
    render("pic_templates/blank_form.html.erb")
    
end

def create_row
    render("pic_templates/new_pic.html.erb")
end



def index
render("pic_templates/index.html.erb")
end

def show
    
    visited_id = params["the_id"]
    p = Photo.find(visited_id)
    
    @the_caption = p.caption
    @the_image_url = p.source
    
    render("pic_templates/show.html.erb")
end

def edit_form
render("pic_templates/edit.html.erb")
end

def update_row
render("pic_templates/update.html.erb")
end

def destroy_row
render("pic_templates/destroy.html.erb")
end


end
    