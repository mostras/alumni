// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../css/application.css'
import { autocompleteSearch } from './autocomplete.js'
import { disabledInputIfCurrentExp } from './disabledInputIfCurrentExp.js'
import { showingSideNavbar } from './showingSideNavbar'
import { toggleButton } from './toggleButton'
import { deleteTag } from './deleteTag'
import { confirmationNoLinkedinUrl } from './confirmationNoLinkedinUrl'
import { disableTagButton } from './disableTagButton'
import { disableUserSectorButton } from './disableUserSectorButton'
import { closeFlashAlert } from './closeFlashAlert'
import { helpBubble } from './helpBubble'
import { sendFormWhenCheck } from './sendFormWhenCheck'
import { sendFormWhenCheckM } from './sendFormWhenCheckM'
import { displayButtonMessage } from './displayButtonMessage'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load",function(){
  autocompleteSearch()
  disabledInputIfCurrentExp()
  showingSideNavbar()
  toggleButton()
  deleteTag()
  confirmationNoLinkedinUrl()
  disableTagButton()
  disableUserSectorButton()
  closeFlashAlert()
  helpBubble()
  sendFormWhenCheck()
  sendFormWhenCheckM()
  // displayButtonMessage()
});











//HIDE FORM WHEN SECTOR > 5
// document.addEventListener("turbolinks:load",function(){
//   var userSectorCards = document.querySelectorAll('.user-sector-card')
// })




















