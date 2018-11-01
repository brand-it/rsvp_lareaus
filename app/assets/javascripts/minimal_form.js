document.addEventListener("turbolinks:load", function () {
  document.querySelectorAll('.minimal-input input').forEach(function(input){
    input.addEventListener('blur', function () {
      if (this.value.trim() != '') {
        this.classList.add('has-val')
      } else {
        this.classList.remove('has-val')
      }
    });
  })
})
