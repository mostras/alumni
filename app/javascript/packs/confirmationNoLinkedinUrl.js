const confirmationNoLinkedinUrl = function() {
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
}

export {confirmationNoLinkedinUrl}
