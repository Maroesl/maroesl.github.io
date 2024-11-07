const counterElement = document.getElementById('counter');

const startTime = 16526908;

function updateCounter() {
  const now = Date.now();
  const elapsedTime = now - startTime;
  const seconds = Math.floor(elapsedTime / 1000);
  const milliseconds = (elapsedTime % 1000) / 10;
  counterElement.textContent = `${seconds}.${milliseconds.toFixed()}`;
}

setInterval(updateCounter, 10);





$(document).ready(function () {
  $('.col-xs-12.col-sm-3.col-md-3.mz-show-list-5').hover(
    function () {
      $(this).find('span').stop(true, true).fadeIn(500);
    },
    function () {
      $(this).find('span').stop(true, true).fadeOut(500);
    }
  );
});


let text = "Lorem lpsum is simply dummy text of the printing and typesetting industry. Lorem lpsum has beenthe industry's standard dummy text ever since the 1500s, when an unknown printer took a galley oftype and scrambled."
$(document).ready(function () {
  $('.ovo-click').click(function () {
    // 首先，收起所有可见的 .text-area 并将其对应的 span.mz-right 设置为 '+'
    $('.text-area:visible').each(function () {
      $(this).slideUp();
      $(this).prev('.ovo-click').find('span.mz-right').text('+');
    });

    // 然后，处理当前点击的 .ovo-click 下的 .text-area
    var textArea = $(this).next('.text-area');
    if (textArea.length === 0) {
      // 如果没有找到 .text-area，则创建一个新的并插入
      $(this).after(`<h5 class="text-area" style="display: none;">${text}</h5>`).next('.text-area').slideDown();
      // 设置当前的 span.mz-right 为 '-'
      $(this).find('span.mz-right').text('-');
    } else {
      // 如果 .text-area 已经存在，根据其可见性来决定是滑上还是滑下
      if (textArea.is(':visible')) {
        textArea.slideUp();
        // 如果是滑上，设置当前的 span.mz-right 为 '+'
        $(this).find('span.mz-right').text('+');
      } else {
        textArea.slideDown();
        // 如果是滑下，设置当前的 span.mz-right 为 '-'
        $(this).find('span.mz-right').text('-');
      }
    }
  });
});



let $ovonone = $('.ovo-none');
let isContentVisible = false; // 初始时不显示绝对定位内容区域

$ovonone.click(function () {
  isContentVisible = !isContentVisible;
  if (isContentVisible) {
    $(this).empty().append('<span class="glyphicon glyphicon-list"></span>');
    $('#absolute-content').slideDown(); // 显示元素
  } else {
    $(this).empty().append('<span class="glyphicon glyphicon-remove"></span>');
    $('#absolute-content').slideUp(); // 隐藏元素
  }
});