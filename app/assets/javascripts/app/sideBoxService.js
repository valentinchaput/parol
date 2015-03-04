$(document).ready(function() {



  $('.amendment').on('click', function(e) { // on click sur l'amendement texte
    e.preventDefault() // j'annule le comportement par défault au click, par exemple, au click sur un lien = ça remonte la page
    amendmentId = $(this).data('amendmentid'); // on choppe l'id de l'amendment
    var that = $(this) // trick js

    if ($('.bg-active').length) { // si il y a déjà un amendement displayed
      if (that.hasClass('active')) { // si on click sur le l'amendment déjà display
        // il ne se passe rien car c'est déjà display ;)
      } else {
        $('.active').removeClass('active'); // sinon, on remove l'état actif des éléments actifs
        $('.bg-active').removeClass('bg-active').addClass('hidden'); // on enlève l'amendement précédent de la box
        getAmendment(amendmentId)
      }

    } else {
      getAmendment(amendmentId)
    }

    function getAmendment(amendmentId) {
      $('#amendment_details_' + amendmentId).toggleClass('bg-active').toggleClass('hidden');
      if ($('[data-amendmentid="' + amendmentId + '"]').size() > 1) {
        $('[data-amendmentid="' + amendmentId + '"]').toggleClass('active');
      } else {
        that.toggleClass('active')
      }
    }
  })
})

$('.article-area').mouseup(function(){
  if (window.getSelection().toString().length != 0) {
    console.log(window.getSelection().toString())

  }
})

