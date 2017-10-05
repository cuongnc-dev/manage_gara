$(document).ready(function() {
  if ($('.message-alert').is(':visible')) {
    setTimeout(function() {
      $('.message-alert').slideUp();
    }, 3000);
  }

  $('#edit-modal').on('hidden.bs.modal', function() {
    $('#edit-modal .modal-body').html('');
  });
});
