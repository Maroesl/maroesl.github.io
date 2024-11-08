// $(window).on('load', function() {
//     var numSnowflakes = 50; // 雪花数量
//     for (var i = 0; i < numSnowflakes; i++) {
//         var $snowflake = $('<div class="snowflake"></div>');
//         // 随机设置雪花的初始位置（水平方向）
//         $snowflake.css('left', Math.random() * $(window).width() + 'px');
//         // 随机设置雪花的初始位置（垂直方向）
//         $snowflake.css('top', Math.random() * $(window).height() + 'px');
//         // 设置雪花的绝对定位
//         $snowflake.css('position', 'absolute');
//         // 为每个雪花添加随机延迟时间和动画
//         var delay = Math.random() * 5; // 0 - 5秒的随机延迟
//         var duration = Math.random() * 5 + 5; // 5 - 10秒的随机持续时间
//         $snowflake.css({
//             'animation-delay': delay + 's',
//             'animation': 'snowfall ' + duration + 's linear infinite'
//         });
//         $('body').append($snowflake);
//     }
// });

