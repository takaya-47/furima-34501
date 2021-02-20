function calc() {
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener('keyup', () => {
    tax = itemPrice.value * 0.1
    taxPrice.innerHTML = tax
    profit.innerHTML = itemPrice.value - tax
  });
};

window.addEventListener('load', calc);