const closeFlashAlert = function() {
  const button = document.querySelector('.close-alert')

  if (button) {
    button.addEventListener('click', (event) => {
      button.parentNode.remove()
    })
  }
}

export { closeFlashAlert }
