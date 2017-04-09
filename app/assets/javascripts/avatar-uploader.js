    $(function() {
      function readURL(input) {
    if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $('.profile-present-avatar').remove();
            $('#img_prev').html("");
            $('#img_prev').attr('src', e.target.result);
                  }
              reader.readAsDataURL(input.files[0]);
                }
              }
              $("#post_post_img").change(function(){
                $('#img_prev').removeClass('hidden');
                readURL(this);
        });
    });