const disableTagButton = function(){
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
}

export {disableTagButton}
