module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["Randomize - Ouvre ton esprit, Randomize ta vie !"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["Découvre des activités auxquelles tu n'aurais jamais pensé près de chez toi. C'est facile, appuie sur Randomize !"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    # meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
