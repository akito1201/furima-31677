const pay = () => {
  Payjp.setPublicKey("pk_test_130eb603c092985afe48c96c");
  const form = document.getElementById("charge-form");
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_record[number]"),
      cvc: formData.get("user_record[cvc]"),
      exp_month: formData.get("user_record[exp_month]"),
      exp_year: `20${formData.get("user_record[exp_year]")}`,
    };
    
//tokenが発行できたらHTMLに埋め込み
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
//クレジットカードの情報消去
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

//再度送信ボタンを押す（preventDefaultがかかってるため)
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener('load', pay);