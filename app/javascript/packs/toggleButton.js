
function togglingButton(wrapper) {
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

const toggleButton = function() {
  const wrapper = document.querySelector('.button-wrapper')
  console.log('je suis la')

  if(wrapper) {
    const buttons = wrapper.querySelectorAll('button')

    togglingButton(wrapper)

    buttons.forEach((button) => {
      button.addEventListener('click', (event) => {
        const selectButton = wrapper.querySelector('.active')
        selectButton.classList.remove('active')
        button.classList.add('active')

        togglingButton(wrapper)
      })
    })
  }
}



export { toggleButton }
