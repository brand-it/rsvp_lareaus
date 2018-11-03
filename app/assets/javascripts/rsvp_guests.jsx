document.addEventListener("turbolinks:load", function () {
  document.querySelectorAll('table tr .delete-button').forEach(function (button) {
    button.addEventListener('click', function (event) {
      event.preventDefault()
      $.ajax({
        method: 'delete',
        url: this.href,
        dataType: 'json'
      }).done((data, textStatus, jqXHR) => {

        document.querySelectorAll('.total-adults-attending').forEach(function (total) {
          total.innerHTML = `${data['data']['total_adults_attending']} Attending`
        })
        document.querySelectorAll('.total-children-attending').forEach(function (total) {
          total.innerHTML = `${data['data']['total_children_attending']} Attending`
        })
        this.closest('tr').remove()
      })
    });
  })
})
