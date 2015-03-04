$(document).ready(function() {

// mode lecture : cliquer sur une zone de texte surlignée permet d'afficher son amendement correspdt
  $('.amendment').on('click', function(e) { // on click sur l'amendement texte
    e.preventDefault(); // j'annule le comportement par défault au click, par exemple, au click sur un lien = ça remonte la page

    var amendmentId = $(this).data('amendmentid'); // on choppe l'id de l'amendment
    var that = $(this); // trick js

    if ($('.bg-active').length) { // si il y a déjà un amendement displayed
      if (that.hasClass('active')) { // si on click sur le l'amendment déjà display
        // il ne se passe rien car c'est déjà display ;)
      } else {
        $('.active').removeClass('active'); // sinon, on remove l'état actif des éléments actifs
        $('.bg-active').removeClass('bg-active').addClass('hidden'); // on enlève l'amendement précédent de la box
        getAmendment(amendmentId);
      }
    }
    else {
      getAmendment(amendmentId);
    }

    // mode lecture : affiche également les zones de texte également concernées par le même amendement
    function getAmendment(amendmentId) {
      $('#amendment_details_' + amendmentId).toggleClass('bg-active').toggleClass('hidden');
      $('.amendment.active').toggleClass('active');
      that.toggleClass('active');
    }
  })
})

// mode edition d'un amendement
$(document).on('click', '.btn-edition', function(){ // enter edition mode
  console.log("j'édite")
  $(this).removeClass('btn-edition').addClass('btn-edition-close') // btn pour js
  makeEditable()
  editionMode()
})

$(document).on('click', '.btn-edition-close', function(){ // escape edition mode
  console.log("je n'édite plus")
  $(this).removeClass('btn-edition-close').addClass('btn-edition').addClass('btn-success')
  makeReadable()
})


// sélection de la zone de texte à modifier
function editionMode() {
  $(document).on('mouseup', '.editable', function(){
    if (window.getSelection().toString().length != 0) {
      $('.initial-selection h3 span').text(window.getSelection().toString())

      // TODO : remove hidden class on add box
      $('.new-amendment').removeClass('hidden');
      $('body').on('click', '.btn-text-replace', function(){
        textIncrementation()
        $('.btn-text-replace').addClass('hidden')
        $('.form-container').removeClass('hidden')

      })

    } else {
      console.log('ajouter un nouveau truc')
    }
  })
}

// incrémentation de la nouvelle zone de texte
function textIncrementation() {
  var selection = window.getSelection().toString()
  var selectionToMatch = $("<a class='editable-amendment'>").text(window.getSelection().toString())[0].outerHTML
  var textToReplace = $('.article-area p').html()
  var newText = textToReplace.replace(selection, selectionToMatch)
  $('.article-area p').html(newText)
  $('.editable-amendment').after("<a class='new-text'></a>")


  $('body').on('keyup', '#amendment_content', function(){
    if (!$('.editable-amendment').hasClass('replaced')) {
      $('.editable-amendment').addClass('replaced')
    }
    var newText = $('#amendment_content').val()
    $('.new-text').text(newText)
  })
}

function makeEditable() {
  $('.article-area').addClass('editable');
}

function makeReadable() {
  $('.article-area').removeClass('editable');
}
