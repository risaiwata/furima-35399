window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    //console.log("イベント発火")
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  });
});

