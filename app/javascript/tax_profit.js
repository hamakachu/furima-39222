function calc (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addTaxPrice.innerHTML = Math.floor(priceInput.value * 0.1)
    profit.innerHTML = Math.floor(priceInput.value * 0.9)
  });
};

window.addEventListener('load', calc)