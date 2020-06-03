$(document).on 'turbolinks:load', ->
  $('#scholastic_records').infiniteScroll
    path: "nav.pagination a[rel=next]"
    append: ".scholastic_record"
    history: false
    prefill: true
    status: '.page-load-status'