const showingSideNavbar = function() {
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
};

export { showingSideNavbar }
