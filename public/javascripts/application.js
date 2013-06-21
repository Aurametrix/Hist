$(function() {
  window.setTimeout(function() {
      $('#notices').slideUp('fast');
  }, 1200);
  
  $('form a.remove_child').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).parents('.fields').hide();
    return false;
  });
  
});
