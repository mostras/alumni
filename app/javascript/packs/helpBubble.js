const helpBubble = function() {
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
}

export { helpBubble }
