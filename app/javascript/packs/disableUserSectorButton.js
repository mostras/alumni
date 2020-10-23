const disableUserSectorButton = function() {
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
}

export {disableUserSectorButton}
