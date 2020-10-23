const deleteTag = function() {
  let links = document.querySelectorAll('.remove-card');
  links.forEach((link) => {
    link.addEventListener('click', (e) => {
      let div = link.parentNode
      if (confirm("Etes vous sûr de vouloir supprimer cet élément de votre profil ?")) {
        div.remove()
      } else {
        e.preventDefault()
        e.stopPropagation()
      }
    });
  });
}

export { deleteTag }
