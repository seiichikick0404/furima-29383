function price(){
  
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");   //販売手数料
   const profit = document.getElementById("profit");           //販売利益
  //  重複文を関数化
   function InsertPrice(fee, gains){
    add_tax.textContent = fee;
    profit.textContent = gains;
   }

   priceInput.addEventListener('input', () => {
         const value = priceInput.value;
         
       if (value >= 300 && value <= 9999999){
         let fee = value * 0.1
         let gains = value - fee
         InsertPrice(fee, gains)
         
        
     } else {
         let fee = '-';
         let gains = '-';
         InsertPrice(fee, gains)
       }
   });
}
  window.addEventListener('load', price);
  