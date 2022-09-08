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
  elements.forEach(element => {
    let dateTextEl = element.querySelector("[class^='styles__CardFooterWrapper-publish__sc'] [class^='style__Paragraph-sc']")
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
    console.log("Missing sort button")
    // add weekday and year
    dateTextEl.innerHTML = dateTextEl.innerHTML.replace('scheduled for ', `scheduled for ${weekday}, `).replace(' at', ` ${year} at`)
  })
  Array.from(elements).sort(compare).forEach((element, i) => {
    element.style.order = i
  })
  elements[0].parentNode.style.display = "flex"
  elements[0].parentNode.style.flexDirection = "column"

}

function getEls() {
  setTimeout(() => {
      elements = document.querySelectorAll(".post_twitter")
      if(elements.length === 0) {
          getEls();
      } else {
        sortElements(elements)
      }
  }, 1000);
}
getEls();