const body = document.querySelector("body");
const navbar = document.querySelector(".navbar");
const menuBtn = document.querySelector(".menu-btn");
const cancelBtn = document.querySelector(".cancel-btn");
const logo = document.querySelector(".logo");
const logo2 = document.querySelector(".logo2");
const login = document.querySelector(".login");
const menu = document.getElementById('menu');
menuBtn.onclick = ()=>{
    navbar.classList.add("show");
    menuBtn.classList.add("hide");
    body.classList.add("disabled");
}
cancelBtn.onclick = ()=>{
    body.classList.remove("disabled");
    navbar.classList.remove("show");
    menuBtn.classList.remove("hide");
}
window.onscroll = ()=>{
    this.scrollY > 20 ? 
    navbar.classList.add("sticky") & logo.classList.add("hide") & logo2.classList.add("show")
    : navbar.classList.remove("sticky") & logo.classList.remove("hide") & logo2.classList.remove("show");
}