function fee() {
  price = document.getElementById("item-price")
  price.addEventListener("input", function(){
  var inputPrice = document.getElementById("item-price").value;
  var tax = inputPrice*0.1; 
  document.getElementById("add-tax-price").innerHTML = tax
  document.getElementById("profit").innerHTML = inputPrice * 110 / 100
  })
  
} 

window.addEventListener("load", fee);

//１価格のフォームをidに紐付けてとってくる
//2とってきたフォームを使ってフォームに入力した時にイベント発火させる
//３価格のフォームに入力した値をとってくる＝価格のフォームのバリュー要素をとってくる
//４とってきた価格を使って手数料と利益を計算
//５計算結果を販売手数料と販売利益のビューにつける（innerHTML）