    $(function() {
      function readURL(input) {
    if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $('.organizer_photo').remove();
            $('#photo_prev').html("");
            $('#photo_prev').attr('src', e.target.result);
                  }
              reader.readAsDataURL(input.files[0]);
                }
              }
              $("#post_post_img").change(function(){
                $('#photo_prev').removeClass('hidden');
                readURL(this);
        });
    });