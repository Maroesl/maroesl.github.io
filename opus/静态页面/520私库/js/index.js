var swiper = new Swiper(".mySwiper", {
  spaceBetween: 30,
  centeredSlides: true,
  autoplay: {
    delay: 2500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
});


document.addEventListener('DOMContentLoaded', function () {
  var listItems = document.querySelectorAll('li');
  listItems.forEach(function (item) {
    item.addEventListener('click', function () {
      listItems.forEach(function (li) {
        li.classList.remove('active');
        var imgs = li.querySelectorAll('.ovo-list-img');
        imgs.forEach(function (img) {
          img.style.display = 'none';
        });
      });
      this.classList.add('active');
      var imgs = this.querySelectorAll('.ovo-list-img');
      imgs.forEach(function (img) {
        img.style.display = 'block';
      });
    });
  });
});