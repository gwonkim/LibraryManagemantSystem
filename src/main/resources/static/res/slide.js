$(document).ready(function(){
    $('.slide').slick({
        autoplay: true,
        speed: 1000,
        autoplaySpeed: 3000,
        dots: true,
        infinite: true,
        speed: 500,
        fade: true,
        arrows: true,
        prevArrow: $('.prev'),
        nextArrow: $('.next'),
    });
});