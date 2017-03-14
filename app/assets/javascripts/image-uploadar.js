$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
                    
      reader.onload = function (e) {
      var imgBlock = $(input).parent()
      imgBlock.find('.event-present-image').remove();
      imgBlock.find('.eimg-thumbnail').html("");
      imgBlock.find('.eimg-thumbnail').attr('src', e.target.result);
    }
        reader.readAsDataURL(input.files[0]);
    }
  }
                    
  $(".preview").change(function(){
  $(this).parent().find('.eimg-thumbnail').removeClass('hidden');
  readURL(this);
  });
});