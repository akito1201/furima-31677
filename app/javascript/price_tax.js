window.addEventListener('load', () => {
  console.log("OK")

//価格入力欄の情報を取得//
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
//販売手数料の計算//
    const addTax = document.getElementById("add-tax-price");
    const margin = inputValue * 0.1
    addTax.innerHTML = Math.floor(margin)
//販売利益の計算//
    const profit = document.getElementById("profit")
    profit.innerHTML = inputValue - Math.floor(margin)
  
  })
})
