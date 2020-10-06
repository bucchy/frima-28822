const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

   const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("card"),
      cvc: formData.get("code"),
      exp_month: formData.get("month"),
      exp_year: `20${formData.get("year")}`,
    };
  
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;

        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
        document.getElementById("order_number").removeAttribute("name");
        document.getElementById("order-cvc").removeAttribute("name");
        document.getElementById("order_exp_month").removeAttribute("name");
        document.getElementById("order_exp_year").removeAttribute("name");
        document.getElementById("charge-form").submit();
      }else {
        alert('カードの番号を確認してください');
      }
      });  
  });
};
window.addEventListener("load", pay);