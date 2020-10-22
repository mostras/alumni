// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../css/application.css'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)



//DELETE TAG-CARD AND SECTOR-CARD WHEN USER CLICK ON CROSS
document.addEventListener("turbolinks:load",function(){
  let links = document.querySelectorAll('.remove-card');
  links.forEach((link) => {
    link.addEventListener('click', (e) => {
      let div = link.parentNode
      if (confirm("Etes vous sûr de vouloir supprimer cet élément de votre profil ?")) {
        div.remove()
      } else {
        e.preventDefault()
        e.stopPropagation()
      }

    });
  });
});

//HIDE FORM WHEN SECTOR > 5
document.addEventListener("turbolinks:load",function(){
  var userSectorCards = document.querySelectorAll('.user-sector-card')
})

//ADD A CONFIRMATION MESSAGE WHEN LINKEDIN USER VALUE IS NULL
document.addEventListener("turbolinks:load",function(){
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
document.addEventListener("turbolinks:load",function(){
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


//DISABLE BUTTON WHEN THE USER_SECTOR CREATION IS NOT DONE CORRECTLY
document.addEventListener("turbolinks:load",function(){
  var addSectorButton = document.getElementById("add_sector_button")
  var selectSector = document.getElementById("user_sector_sector_id")

  if (addSectorButton && selectSector) {
    addSectorButton.disabled = true

    selectSector.addEventListener('change', (event) => {
      if (selectSector.value) {
        addSectorButton.disabled = false
      };
    });
  }
})

//Close the flash alert
document.addEventListener("turbolinks:load",function(){
  const button = document.querySelector('.close-alert')

  if (button) {
    button.addEventListener('click', (event) => {
      button.parentNode.remove()
    })
  }
})


//Show help-message when hover link

document.addEventListener("turbolinks:load",function(){
  const helpBubble = document.querySelector('.help-bubble')
  const textBoxIcon = document.querySelector('.text-box')
  const crossIcon = document.querySelector('.cross')
  const helpMessage = document.getElementById('help-message')

  let openOrCloseHelpMessage = false;

  function openHelpMessage() {
    if(openOrCloseHelpMessage == true) {
      textBoxIcon.style.display = 'none'
      crossIcon.style.display = 'block'
      helpMessage.style.display = 'block'
    }

    if(openOrCloseHelpMessage == false) {
      textBoxIcon.style.display = 'block'
      helpMessage.style.display = 'none'
      crossIcon.style.display = 'none'
    }
  }

  if(helpBubble) {
    helpBubble.addEventListener("click", (event) => {
      console.log('je clique')
      openOrCloseHelpMessage = !openOrCloseHelpMessage
      openHelpMessage()
    })
  }
})


//Toggle button for updating exp profil
function toggleButton(wrapper) {

    const activeButton = wrapper.querySelector('.active')
    const automaticButton = wrapper.querySelector('#automatic')
    const manualButton = wrapper.querySelector('#manual')

    const automaticWrapper = document.querySelector('.automatic-wrapper')
    const manualWrapper = document.querySelector('.manual-wrapper')

    if (activeButton == automaticButton) {
      manualWrapper.style.display = 'none'
      automaticWrapper.style.display = 'block'
    } else {
      manualWrapper.style.display = 'block'
      automaticWrapper.style.display = 'none'
    }
  }



document.addEventListener("turbolinks:load",function(){
  const wrapper = document.querySelector('.button-wrapper')
  if(wrapper) {
    const buttons = wrapper.querySelectorAll('button')

    toggleButton(wrapper)

    buttons.forEach((button) => {
      button.addEventListener('click', (event) => {
        const selectButton = wrapper.querySelector('.active')
        selectButton.classList.remove('active')
        button.classList.add('active')

        toggleButton(wrapper)
      })
    })
  }

})


//send form
document.addEventListener("turbolinks:load",function(){
  const checkBox = document.querySelector('.set-automatic-updating')
  const form = document.querySelector('.edit_user')

  if(checkBox) {
    checkBox.addEventListener('click', (event) => {
      checkBox.parentNode.submit()
    })
  }
})

document.addEventListener("turbolinks:load",function(){
  const checkBox = document.querySelector('.set-manual-updating')
  const form = document.querySelector('.edit_user')

  if (checkBox) {
    checkBox.addEventListener('click', (event) => {
      checkBox.parentNode.submit()
    })
  }
})

//disabled current if end_time (experience)
document.addEventListener("turbolinks:load",function(){
  const endTimeField = document.querySelector('#end_date_exp')
  const currentCheckBox = document.querySelector('#current_exp')

  if(currentCheckBox) {
    if (currentCheckBox.checked) {
      endTimeField.value = null
      endTimeField.classList.add('disabled')
      endTimeField.disabled = true
    } else {
      endTimeField.classList.remove('disabled')
      endTimeField.disabled = false
    }

    currentCheckBox.addEventListener('change', (event) => {
      if (currentCheckBox.checked) {
        endTimeField.value = null
        endTimeField.classList.add('disabled')
        endTimeField.disabled = true
      } else {
        endTimeField.classList.remove('disabled')
        endTimeField.disabled = false
      }
    });
  }
})

//show side navigation bar
document.addEventListener("turbolinks:load",function(){
  const navigationButton = document.querySelector('.side-navigation-button')
  if(navigationButton) {
    const openIcon = navigationButton.querySelector('.open')
    const closeIcon = navigationButton.querySelector('.close')
    const sideNavigationBar = document.querySelector('.side-navigation-bar')

    let openOrClose = false;

    function choose() {
      if(openOrClose == true) {
        sideNavigationBar.style.transform = 'translateX(260px)'
        openIcon.style.display = 'none';
        closeIcon.style.display = 'block';
      }

      if(openOrClose == false) {
        sideNavigationBar.style.transform = 'translateX(-260px)'
        openIcon.style.display = 'block';
        closeIcon.style.display = 'none';
      }
    }

    navigationButton.addEventListener('click', (event) => {
      openOrClose = !openOrClose
      choose()
    })
  }
})

















