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
  
  function add_new_option(var_number) {
    var link = '<a href="#remove_var" class="remove_value">remove</a>';
    var wrap_div = '<div class="extra_info_value">';
    
    return wrap_div + '<input id="food_extra_info_first_variables__value" name="food[extra_info]['+var_number+'][]" size="30" type="text"> ' + link + '</div>'
  }
  
  $(".new_first_option").click(function(){
    $("#first_vars").append(add_new_option("first_variables"));
  });
  
  $(".new_second_option").click(function(){
    $("#second_vars").append(add_new_option("second_variables"));
  });
  
  
  $(".remove_value").live('click', function(){
    var input = $(this).prev('input[type=text]')[0]
    input.value= '';
    
    $(this).parent().hide();
  });
});
