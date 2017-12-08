widgetOptions = {
  cloud_name: "dtyks84om"
  upload_preset: "nvw0ywnb"
  multiple: false
}

_pathPrefix = "https://res.cloudinary.com/dtyks84om/image/upload/"
_thumbnailAddOn = "w_400/"

$(->
  $("#upload-widget-opener").click(->
    cloudinary.openUploadWidget(widgetOptions,
      (error, result) ->
        path = result[0].path
        $("#img-path-field").val(_pathPrefix + path)
        $("#thumbnail-path-field").val(_pathPrefix + _thumbnailAddOn + path)
        $("#img-preview").attr("src", _pathPrefix + _thumbnailAddOn + path)
    )
  )
)
