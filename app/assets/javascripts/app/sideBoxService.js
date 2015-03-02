$(document).ready(function() {
  $('.amendment').on('click', function() {
    amendmentId = $(this).data('amendmentid')
    $('#amendment_details_' + amendmentId).toggleClass('bg-active').toggleClass('hidden')
  })
})