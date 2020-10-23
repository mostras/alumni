const disabledInputIfCurrentExp = function() {
  const endTimeSchoolExp = document.querySelector('#school_experience_end_time')
  const endTimeWorkExp = document.querySelector('#work_experience_end_time')

  const currentCheckBox = document.querySelector('#current_exp')

  if(currentCheckBox && endTimeSchoolExp) {
    if (currentCheckBox.checked) {
      endTimeSchoolExp.classList.add('disabled')
      endTimeSchoolExp.disabled = true
    } else {
      endTimeSchoolExp.classList.remove('disabled')
      endTimeSchoolExp.disabled = false
    }

    currentCheckBox.addEventListener('change', (event) => {
      if (currentCheckBox.checked) {
        endTimeSchoolExp.classList.add('disabled')
        endTimeSchoolExp.disabled = true
      } else {
        endTimeSchoolExp.classList.remove('disabled')
        endTimeSchoolExp.disabled = false
      }
    });
  } else if(currentCheckBox && endTimeWorkExp) {
    if (currentCheckBox.checked) {
      endTimeWorkExp.classList.add('disabled')
      endTimeWorkExp.disabled = true
    } else {
      endTimeWorkExp.classList.remove('disabled')
      endTimeWorkExp.disabled = false
    }

    currentCheckBox.addEventListener('change', (event) => {
      if (currentCheckBox.checked) {
        endTimeWorkExp.classList.add('disabled')
        endTimeWorkExp.disabled = true
      } else {
        endTimeWorkExp.classList.remove('disabled')
        endTimeWorkExp.disabled = false
      }
    });
  }
};

export { disabledInputIfCurrentExp };
