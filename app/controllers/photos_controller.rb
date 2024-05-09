class PhotosController < ApplicationController
  def all_photos
    @photos = Photo.order(:created_at => :desc)
    render({:template => "photos_page/all_photos"})
  end

  def photo_detail
    picture_id = params.fetch("photo_id")
    @picture = Photo.where({:id => picture_id})[0]
    render({:template => "photos_page/photo_detail"})
  end

  def add_new_photo
   
    @new_photo = Photo.new
    @new_photo.image = params.fetch("input_image")
    @new_photo.caption = params.fetch("input_caption")
    @new_photo.owner_id = params.fetch("input_owner_id")

    if @new_photo.valid?
      @new_photo.save
      redirect_to("/photos/#{@new_photo.id}", { :notice => "Photo posted successfully." })
    else
      redirect_to("/photos", { :notice => "Photo failed to post successfully." })
    end

  end


  def update
  photo_id = params.fetch("photo_id")
  @updated_photo = Photo.where(:id => photo_id)[0]

  @updated_photo.image =  params.fetch("input_image")
  @updated_photo.caption = params.fetch("input_caption")

  if @updated_photo.valid?
    @updated_photo.save
    redirect_to("/photos/#{@updated_photo.id}", { :notice => "Photo updated successfully." })
  else
    redirect_to("/photos", { :notice => "Photo failed to update successfully." })
  end

end

def destroy
  the_id = params.fetch("photo_id")
  @photo = Photo.where({ :id => the_id })[0]

  @photo.destroy

  redirect_to("/photos", { :notice => "Photo deleted successfully."} )
end

def add_comment

  @new_comment = Comment.new
  @new_comment.photo_id  = params.fetch("input_photo_id")
  @new_comment.author_id = params.fetch("input_author_id")
  @new_comment.body = params.fetch("input_comment")

  if @new_comment.valid?
    @new_comment.save
    redirect_to("/photos/#{@new_comment.photo_id}", { :notice => "Comment posted successfully." })
  else
    redirect_to("/photos", { :notice => "Comment failed to post successfully." })
  end

end


end
