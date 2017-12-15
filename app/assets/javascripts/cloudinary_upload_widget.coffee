widgetOptions = {
  cloud_name: "dtyks84om"
  upload_preset: "nvw0ywnb"
  multiple: false
  sources: ["local", "url", "facebook", "instagram", "google_photos"]
}

_previewPath = "https://res.cloudinary.com/dtyks84om/image/upload/w_400/"

$(->
  $("#upload-widget-opener").click(->
    cloudinary.openUploadWidget(widgetOptions,
      (error, result) ->
        $("#public-id-field").val(result[0].public_id)
        $("#img-preview").attr("src", _previewPath + result[0].path)
    )
  )
)
