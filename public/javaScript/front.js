const burgerMenu = document.querySelector('.burger_menu')
const listMenu = document.querySelector('.list_menu')

burgerMenu.addEventListener("click", function () {
    listMenu.classList.toggle("hidden");
});


