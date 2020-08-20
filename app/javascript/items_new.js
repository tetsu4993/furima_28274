// function addTax() {
//   console.log(111)
//   const addTax= document.getElementsByClassName("price-input");
//   console.log(333)
//   addTax.addEventListener("oninput", function() {
//     document.write("add-tax-price" 
//       (document.getElementById("item-price").value * 0.1)
//     );
//   });
// }

// console.log(222)
// window.addEventListener('load', addTax);

// ①：ユーザーが入力するフォームのテキストフィールドのHTMLの要素を取得（今の２行目のような記述）
// ②：①で取得した要素が入力された時にイベント発火（今の３行目のような記述）
// ③：入力された金額を取得（getElementByIdにvalueと言うメソッドを使用する）
// ④：③の金額を元に計算
// ⑤：④で計算した金額を実際のビューに表示

window.addEventListener("load", function() {
  //console.log(111)
  // const addTax= document.getElementsByClassName("price-input");
  const price = document.getElementById("item-price");
  //const pricevalue = document.getElementById("item-price").value;
  const addtax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  //console.log(333)
  price.addEventListener("input", function() {
    const tax = this.value * 0.1
    const rieki = this.value - tax
    // let tax = e.target.value
    console.log(tax)
    console.log(rieki)
    // document.write("#add-tax-price"
    //   (document.getElementById("item-price").value * 0.1)
    // );
    // addtax.insertAdjacentHTML('afterend',tax)
    addtax.textContent = tax;
    profit.textContent = rieki;
  });
  // window.addEventListener('load');
})

//console.log(222)
// window.addEventListener('load', addTax);