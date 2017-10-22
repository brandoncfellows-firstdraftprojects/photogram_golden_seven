class PicturesController < ApplicationController

def new_form
    
    render("pic_templates/blank_form.html.erb")
    
end

def create_row
    
    p = Photo.new
    p.caption = params["caption"]
    p.source = params["image_url"]
    p.save
    
    @count = Photo.count
    render("pic_templates/new_pic.html.erb")
end



def index
    @all_photos = Photo.all
    
render("pic_templates/index.html.erb")
end

def show
    
    @visited_id = params["the_id"]
    p = Photo.find(@visited_id)
    
    @the_caption = p.caption
    @the_image_url = p.source
    hours = (Time.now - p.updated_at).to_i/3600
    if hours ==1
        @time_between = hours.to_s + " hour"
    else
        @time_between = hours.to_s + " hours"
        
    end
    
    render("pic_templates/show.html.erb")
end

def edit_form
    
    @index = params["an_id"]
    
render("pic_templates/edit.html.erb")
end

def update_row
    
    @index = params["some_id"]
    new_caption = params["caption"]
    new_url = params["image_url"]
    p = Photo.find(@index)
    p.source = new_url
    p.caption = new_caption
    p.save
    
render("pic_templates/update.html.erb")
end

def destroy_row
    
    @id = params["toast_id"]
    p=Photo.find(@id)
    p.destroy
    
    @count = Photo.count
    
render("pic_templates/destroy.html.erb")
end


end
    