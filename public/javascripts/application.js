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
  
  $(".new_first_option").click(function(){
    var link = '<a href="#remove_var" class="remove_value">remove</a>';
    var wrap_div = '<div class="extra_info_value">';
    
    $("#first_vars").append(wrap_div + '<input id="food_extra_info_first_variables__value" name="food[extra_info][first_variables][]" size="30" type="text"> ' + link + '</div>');
  });
  
  $(".remove_value").live('click', function(){
    $(this).parent().remove();
  });
});
