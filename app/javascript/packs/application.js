// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


//DELETE TAG-CARD AND SECTOR-CARD WHEN USER CLICK ON CROSS
document.addEventListener('DOMContentLoaded', (event) => {
  let links = document.querySelectorAll('.remove-card');
  links.forEach((link) => {
    link.addEventListener('click', (event) => {
      let div = link.parentNode
      div.remove()
    });
  });
});

//HIDE FORM WHEN SECTOR > 5
document.addEventListener('DOMContentLoaded', (event) => {
  var userSectorCards = document.querySelectorAll('.user-sector-card')
  console.log(userSectorCards.length)
})

//ADD A CONFIRMATION MESSAGE WHEN LINKEDIN USER VALUE IS NULL
document.addEventListener('DOMContentLoaded', (event) => {
  var input = document.getElementById("url")
  var btnLinkedin = document.getElementById("linkedin-button")

  if (btnLinkedin) {
    btnLinkedin.addEventListener('click', (event) => {
        if (input && !input.value) {
          if (confirm("Attention, sans URL LinkedIn votre profil ne pourra pas être complété et ne sera pas automatiquement mis à jour. Vous pourrez ajouter une URL plus tard sur votre profil. Souhaitez-vous quand même continuer ?")) {
            // Save it
          } else {
            event.preventDefault()
          }
      }
    });
  };
});

//DISABLE BUTTON WHEN THE TAG-DIPLOMA CREATION IS NOT DONE CORRECTLY
document.addEventListener('DOMContentLoaded', (event) => {
  var addTagButton = document.getElementById("add_tag_button")
  var selectDiploma = document.getElementById("tag_diploma_id")
  var selectYear = document.getElementById("tag_year")

  if (addTagButton && selectDiploma && selectYear) {
    addTagButton.disabled = true

    selectDiploma.addEventListener('change', (event) => {
      if (selectDiploma.value && selectYear.value) {
        addTagButton.disabled = false
      };
    });

    selectYear.addEventListener('change', (event) => {
      if (selectYear.value && selectDiploma.value) {
        addTagButton.disabled = false
      };
    });
  }
})
