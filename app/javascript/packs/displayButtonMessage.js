const displayButtonMessage = function() {
  const message = document.getElementById('message')
  const editDeleteButtons = document.getElementById('edit-delete-message')
  const newButton = document.getElementById('new-message')

  if (message) {
    editDeleteButtons.style.display = 'block'
    newButton.style.display = 'none'
  } else {
    editDeleteButtons.style.display = 'none'
    newButton.style.display = 'block'
  }
}

export { displayButtonMessage }
