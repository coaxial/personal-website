setInterval(function() {
  ageInSecs = Number($('#age_in_secs').text().replace(/,/g, '')) + 1
  ageInSecs = ageInSecs.toString().replace(/([0-9]{3})/g, '$1,').replace(/,$/, '')
   $('#age_in_secs').text(ageInSecs)
}, 1000)
