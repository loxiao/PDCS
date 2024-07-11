//轮播图
let slideIndex = 1;
showSlides(slideIndex);

setInterval(function () {
    moveSlide(1);
}, 3000);

function moveSlide(n) {
    showSlides(slideIndex += n);
}

function showSlides(n) {
    let slides = document.getElementsByClassName("carousel-slide");
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.opacity = "0";
        slides[i].style.visibility = "hidden";
        slides[i].classList.remove('active');
    }
    slides[slideIndex - 1].style.opacity = "1";
    slides[slideIndex - 1].style.visibility = "visible";
    slides[slideIndex - 1].classList.add('active');
}