// add announcement
const addAnnouncement = () => {
const headerWrapper = document.querySelector('.js-header-wrapper')
if (headerWrapper.querySelector('.announcement') === null) {
  const announcement = document.createElement('div')
  announcement.classList.add('announcement')
  announcement.dataset.state = 'info'
  announcement.onclick = (e) => {
    if(e.target.id === "announcementButton") {
      if (announcement.dataset.state === "info") return announcement.dataset.state = "warning"
      if (announcement.dataset.state === "warning") return announcement.dataset.state = "error"
      if (announcement.dataset.state === "error") return announcement.dataset.state = "info"
    }
    if(e.target.id === "icon") {
      announcement.classList.toggle('muted')
    }
  }
  announcement.innerHTML = `<svg id="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8Zm8-6.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13ZM6.5 7.75A.75.75 0 0 1 7.25 7h1a.75.75 0 0 1 .75.75v2.75h.25a.75.75 0 0 1 0 1.5h-2a.75.75 0 0 1 0-1.5h.25v-2h-.25a.75.75 0 0 1-.75-.75ZM8 6a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"></path></svg>GitHub users are now required to enable two-factor authentication as an additional security measure. <button id="announcementButton">Add 2FA</button>`

  headerWrapper.insertBefore(announcement, headerWrapper.firstChild)
} else {
  const announcement = headerWrapper.querySelector('.announcement')
  if (announcement.dataset.state === "info") return announcement.dataset.state = "warning"
  if (announcement.dataset.state === "warning") return announcement.dataset.state = "error"
  if (announcement.dataset.state === "error") return announcement.dataset.state = "info"
}

}


const addToast = (container) => {
  const states = ['success', 'warning', 'error']
  const toast = document.createElement('div')
  toast.classList.add('toast')
  toast.dataset.state = states[Math.floor(Math.random() * states.length)]
  toast.onclick = (e) => {
    if(e.target.classList.contains("close")) {
      e.target.parentNode.classList.add('remove')
      setTimeout(() => {
        e.target.parentNode.remove()
      }, 1050);
    }
  }
  toast.innerHTML = `<div class="icon">
  <svg id="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8Zm8-6.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13ZM6.5 7.75A.75.75 0 0 1 7.25 7h1a.75.75 0 0 1 .75.75v2.75h.25a.75.75 0 0 1 0 1.5h-2a.75.75 0 0 1 0-1.5h.25v-2h-.25a.75.75 0 0 1-.75-.75ZM8 6a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"></path></svg>
  </div>
  <div class="text">
  Some toast about something that the user just triggered on multiple lines. All toasts are dismissible.
  </div>
  <div class="close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path d="M3.72 3.72a.75.75 0 0 1 1.06 0L8 6.94l3.22-3.22a.749.749 0 0 1 1.275.326.749.749 0 0 1-.215.734L9.06 8l3.22 3.22a.749.749 0 0 1-.326 1.275.749.749 0 0 1-.734-.215L8 9.06l-3.22 3.22a.751.751 0 0 1-1.042-.018.751.751 0 0 1-.018-1.042L6.94 8 3.72 4.78a.75.75 0 0 1 0-1.06Z"></path></svg></div>`
  container.appendChild(toast)
}

const runScript = () => {
  const ui = document.createElement('div')
  ui.id = "controlUI"
  ui.innerHTML = `<button id="addAnnouncement">A</button><button id="addToast">T</button>`
  document.body.appendChild(ui)
  
  const toastContainer = document.createElement('div')
  toastContainer.id = "toastContainer"
  toastContainer.onmouseenter = (e) => {
    toastContainer.querySelectorAll('.toast').forEach(toast => {
      toast.classList.add('containerHovered')
    })
  }
    toastContainer.onmouseleave = (e) => {
    toastContainer.querySelectorAll('.toast').forEach(toast => {
      toast.classList.remove('containerHovered')
    })
  }
  document.body.appendChild(toastContainer)

  ui.onclick = (e) => {
  if(e.target.id === "addAnnouncement") return addAnnouncement()
  if(e.target.id === "addToast")  return addToast(toastContainer)
}
}

setTimeout(() => {
  runScript()
}, 500);