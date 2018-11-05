document.addEventListener("turbolinks:load", function () {
  document.querySelectorAll('.minimal-input input').forEach(function(input) {
    addHasValue = function(input) {
      if (input.value.trim() != '') {
        input.classList.add('has-val')
      } else {
        input.classList.remove('has-val')
      }
    }
    addHasValue(input);
    input.addEventListener('blur', function () {
      addHasValue(this);
    });
  })
  $(".minimal-checkbox-input input[type='checkbox']").bootstrapSwitch('onColor', 'success');

})

document.addEventListener('turbolinks:before-cache', function () {
  $(".minimal-checkbox-input input[type='checkbox']").bootstrapSwitch('destroy')
})
