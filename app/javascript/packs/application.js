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

console.log('coucou')

let links = document.querySelectorAll('.remove-card');



document.addEventListener('DOMContentLoaded', (event) => {
  links.forEach((link) => {
  link.addEventListener('click', () => {
    let div = link.parentNode
    div.remove()
  });
});
})


document.addEventListener('DOMContentLoaded', (event) => {
  var input = document.getElementById("url")
  var btnLinkedin = document.getElementById("linkedin-button")
  console.log(btnLinkedin)

  btnLinkedin.addEventListener('click', (event) => {

      if (input && !input.value) {
      console.log(input)

      if (confirm("Attention, sans URL LinkedIn votre profil ne pourra pas être complété et ne sera pas automatiquement mis à jour. Souhaitez-vous quand même continuer ?")) {
        // Save it!
        console.log('Thing was saved to the database.');
      } else {
        event.preventDefault()
        console.log('Thing was not saved to the database.');
      }
    }
  })
})





