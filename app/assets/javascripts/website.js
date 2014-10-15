$(window).bind("load", function() {

  // Autoplay the YouTube video when opening the modal
    $('[data-reveal-id="daftpunk-modal"]').click(function () {
    var originalSrcValue = $('#daftpunk-modal iframe').attr('src');
    $('#daftpunk-modal iframe').attr('src', originalSrcValue + '?autoplay=1');
  });

  // And stop playing when closing it
  $(document).on('close.fndtn.reveal', '[data-reveal]', function() {
    var originalSrcValue = $('#daftpunk-modal iframe').attr('src');
    $('#daftpunk-modal iframe').attr('src', originalSrcValue.replace(/\?autoplay\=1/, ''));
  });

  // Update the seconds count every second
  setInterval(function() {
    var ageInSecs = Number($('#age_in_secs').text().replace(/,/g, '')) + 1;
    ageInSecs = ageInSecs.toString().replace(/([0-9]{3})/g, '$1,').replace(/,$/, '');
    $('#age_in_secs').text(ageInSecs);
  }, 1000);
});
