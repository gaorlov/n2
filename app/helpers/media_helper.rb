module MediaHelper
  
  def thumb_image_or_default image
    url = nil
    case image.class.name
      when String.name
        url = image
      when Gallery.name
        url = image.thumb_url
      when Image.name
        url = image.thumb_url
      when Video.name
        url = image.thumb_url
      when Classified.name
        url = image.images.first.try(:thumb_url)
      when Content.name
        url = image.images.first.try(:thumb_url)
      else
      	url = nil
    end
    url || 'default/watermark.jpg'
  end

  def medium_image_or_default image
    url = nil
    case image.class.name
      when String.name
        url = image
      when Gallery.name
        url = image.full_url
      when Image.name
        url = image.full_url
      when Video.name
        url = image.full_url
      when Classified.name
        url = image.images.first.try(:full_url)
      when Content.name
        url = image.images.first.try(:full_url)
      else
      	url = nil
    end
    url || 'default/watermark.jpg'
  end
  
end
