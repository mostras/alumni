const sendFormWhenCheck = function() {
  const checkBox = document.querySelector('.set-automatic-updating')
  const form = document.querySelector('.edit_user')

  if(checkBox) {
    checkBox.addEventListener('click', (event) => {
      checkBox.parentNode.parentNode.submit()
    })
  }
}

export { sendFormWhenCheck }
