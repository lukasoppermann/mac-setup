function compare( a, b ) {
  if ( a.dataset.date < b.dataset.date ){
    return -1;
  }
  if ( a.dataset.date > b.dataset.date ){
    return 1;
  }
  return 0;
}

let elements = document.querySelectorAll(".post_twitter")
const now = new Date()

const sortElements = (elements) => {
  console.log("Sorting")
  elements.forEach(element => {
    if (!element.getAttribute("data-isTransformed", true)) {
      let dateTextEl = element.querySelector("[class^='styles__CardFooterWrapper-publish__sc'] [class^='style__Paragraph-sc']")
      if (!dateTextEl) {
        return;
      }
      let dateText = dateTextEl.innerHTML
      // remove text around date
      dateText = dateText.replace('Draft scheduled for ', '').replace('(PDT).', '').replace(' at', '').replace('th', '').replace('rd', '').replace('st', '').replace('nd', '').split(" ")
      // get correct year
      let currentMonth = now.getMonth()
      let dateMonth = new Date(Date.parse(dateText[0] +" 1, 2012")).getMonth()
      let year = currentMonth <= dateMonth ? new Date().getFullYear() : new Date().getFullYear() + 1
      // parse
      let date = Date.parse(`${dateText[0]} ${dateText[1]} ${year} ${dateText[2]}`)
      // set dataset 
      element.dataset.date = date
      // get week day
      let weekday = new Intl.DateTimeFormat('en-US', { weekday: 'long'}).format(new Date(date))
      // add weekday and year
      dateTextEl.innerHTML = dateTextEl.innerHTML.replace('scheduled for ', `scheduled for ${weekday}, `).replace(' at', ` ${year} at`)
      element.setAttribute("data-isTransformed", true)
    }
  })

  let sortedArray = Array.from(elements).sort(compare)

  if (elements[0].parentNode.getAttribute("data-inverted") === "yes") {
    sortedArray.reverse()
    elements[0].parentNode.setAttribute("data-inverted", "no")
  } else {
    elements[0].parentNode.setAttribute("data-inverted", "yes")
  }

  sortedArray.forEach((element, i) => {
    element.style.order = i
  })

  elements[0].parentNode.style.display = "flex"
  elements[0].parentNode.style.flexDirection = "column"
}

function addSortButton() {
  const nav = document.querySelector("[class^=Nav__NavList]")
  const sortButton = document.createElement("li")
  const sortButtonA = document.createElement("button")
  sortButtonA.textContent = "Sort"
  sortButton.setAttribute('class', nav.querySelector("li").getAttribute("class"))
  sortButton.addEventListener('click', () => {
    const elements = document.querySelectorAll(".post_twitter")
    sortElements(elements)
  })
  sortButton.append(sortButtonA)
  nav.append(sortButton)
}

function getEls() {
  setTimeout(() => {
      elements = document.querySelectorAll(".post_twitter")
      if(elements.length === 0) {
          getEls();
      } else {
        sortElements(elements)
        addSortButton()
      }
  }, 1000);
}


getEls();

