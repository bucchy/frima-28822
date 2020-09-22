function fee() {
  price = document.getElementById("item-price")
  price.addEventListener("input", function(){
  var inputPrice = document.getElementById("item-price").value;
  var tax = inputPrice*0.1; 
  document.getElementById("add-tax-price").innerHTML = tax
  document.getElementById("profit").innerHTML = ( inputPrice - tax )
  })
  
} 

window.addEventListener("load", fee);

