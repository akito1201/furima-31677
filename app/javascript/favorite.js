const favorite = () => {
  
  const favoriteClick = document.getElementById("favorite-btn");
  const favoriteMark = document.getElementById("favorite-star-icon");
  const favoriteText = document.getElementById("favorite")

    favoriteClick.addEventListener("click", () => {
      const itemId = favoriteClick.getAttribute("data_id");
      console.log(itemId);
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/items/${itemId}/favorites`, true);
      XHR.responseType = "json";
      XHR.send();

      XHR.onload = () => {
        const item = XHR.response.post
        if (item.checked == true) {
          favoriteClick.setAttribute("style", "background-color: #FF6600; color: white;")
          favoriteText.innerHTML = "お気に入り登録済み"
          
        } else if (item.checked == false) {
          favoriteClick.setAttribute("style", "background-color: white;")
          favoriteText.innerHTML = "お気に入りに登録する"
        }
      }
    });
    }

    window.addEventListener('load', favorite)