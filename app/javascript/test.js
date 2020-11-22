const check = () => {
  
    const favoriteClick = document.querySelectorAll(".star-icon");
    favoriteClick.forEach(function (favorite) {
      favorite.addEventListener("click", () => {
        const itemId = favorite.getAttribute("data_id");
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `items/${itemId}/favorites`, true);
        XHR.responseType = "json"
        XHR.send();

        XHR.onload = () => {
          const item = XHR.response.post
          if (item.checked == true) {
          favorite.setAttribute("style", "background-color: red;")
          } else if (item.checked == false) {
            favorite.setAttribute("style", "background-color: blue;")
          }
            }
            })
          })

        }
        
    
    window.addEventListener('load', check)