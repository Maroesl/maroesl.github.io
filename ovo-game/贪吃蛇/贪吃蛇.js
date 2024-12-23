var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

var snake = []; // 定义一条蛇，画蛇的身体
var snakeCount = 6; // 初始化蛇的长度
var foodx = 0;
var foody = 0;
var togo = 0;
var moveInterval;
var paused = false; // 新增变量，用于记录游戏暂停状态
var score = 0; // 初始化分数为0

function drawtable() { // 画地图的函数
    ctx.clearRect(0, 0, 900, 600); // 清除画布重新绘制
    for (var i = 0; i < 60; i++) { // 画竖线
        ctx.strokeStyle = "#e2e2e2";
        ctx.beginPath();
        ctx.moveTo(15 * i, 0);
        ctx.lineTo(15 * i, 600);
        ctx.closePath();
        ctx.stroke();
    }
    for (var j = 0; j < 40; j++) { // 画横线
        ctx.strokeStyle = "#e2e2e2";
        ctx.beginPath();
        ctx.moveTo(0, 15 * j);
        ctx.lineTo(900, 15 * j);
        ctx.closePath();
        ctx.stroke();
    }

    for (var k = 0; k < snakeCount; k++) { // 画蛇的身体
        ctx.fillStyle = "#8A2BE2";
        if (k == snakeCount - 1) {
            ctx.fillStyle = "#FF1493 "; // 蛇头的颜色与身体区分开
        }
        ctx.fillRect(snake[k].x, snake[k].y, 15, 15);
    }

    // 绘制食物
    ctx.fillStyle = "red";
    ctx.fillRect(foodx, foody, 15, 15);
    ctx.fill();

    // 绘制分数
    drawScore();

    
}

function start() { // 定义蛇的坐标
    for (var k = 0; k < snakeCount; k++) {
        snake[k] = { x: k * 15, y: 0 };
    }

    drawtable();
}

function addfood() {
    foodx = Math.floor(Math.random() * 60) * 15; // 随机产生一个0-59之间的数
    foody = Math.floor(Math.random() * 40) * 15;

    for (var k = 0; k < snake.length; k++) {
        if (foodx == snake[k].x && foody == snake[k].y) { // 防止产生的随机食物落在蛇身上
            addfood();
        }
    }
}

document.addEventListener('touchstart', handleTouchStart, false); // 监听触摸开始事件
document.addEventListener('touchmove', handleTouchMove, false); // 监听触摸移动事件

var touchStartX, touchStartY, touchEndX, touchEndY; // 触摸点坐标

function handleTouchStart(e) {
    touchStartX = e.touches[0].pageX;
    touchStartY = e.touches[0].pageY;
    // 阻止默认事件，防止页面滚动
    e.preventDefault();
}

function handleTouchMove(e) {
    touchEndX = e.touches[0].pageX;
    touchEndY = e.touches[0].pageY;
    var diffX = touchEndX - touchStartX;
    var diffY = touchEndY - touchStartY;
    if (Math.abs(diffX) > Math.abs(diffY)) { // 横向移动
        if (diffX > 0) {
            togo = 3; // 向右走
        } else {
            togo = 1; // 向左走
        }
    } else { // 纵向移动
        if (diffY > 0) {
            togo = 4; // 向下走
        } else {
            togo = 2; // 向上走
        }
    }
    // 阻止默认事件，防止页面滚动
    e.preventDefault();
}

function move() {
    if (!paused) {
        switch (togo) {
            case 1: snake.push({ x: snake[snakeCount - 1].x - 15, y: snake[snakeCount - 1].y }); break; // 向左走
            case 2: snake.push({ x: snake[snakeCount - 1].x, y: snake[snakeCount - 1].y - 15 }); break;
            case 3: snake.push({ x: snake[snakeCount - 1].x + 15, y: snake[snakeCount - 1].y }); break;
            case 4: snake.push({ x: snake[snakeCount - 1].x, y: snake[snakeCount - 1].y + 15 }); break;
            case 5: snake.push({ x: snake[snakeCount - 1].x - 15, y: snake[snakeCount - 1].y - 15 }); break;
            case 6: snake.push({ x: snake[snakeCount - 1].x + 15, y: snake[snakeCount - 1].y + 15 }); break;
            default: snake.push({ x: snake[snakeCount - 1].x + 15, y: snake[snakeCount - 1].y });
        }
        snake.shift(); // 删除数组第一个元素
    }

    drawtable();
    isEat();
    isDead();
}

function keydown(e) {
    switch (e.keyCode) {
        case 37: togo = 1; break;
        case 38: togo = 2; break;
        case 39: togo = 3; break;
        case 40: togo = 4; break;
        case 65: togo = 5; break;
        case 68: togo = 6; break;
    }
}

function isEat() { // 吃到食物后长度加1
    if (snake[snakeCount - 1].x == foodx && snake[snakeCount - 1].y == foody) {
        addfood();
        snakeCount++;
        snake.unshift({ x: -15, y: -15 });
        score += 1; // 每次吃到食物分数增加1
    }
}

function isDead() {
    if (snake[snakeCount - 1].x > 885 || snake[snakeCount - 1].y > 585 || snake[snakeCount - 1].x < 0 || snake[snakeCount - 1].y < 0 || self_collision()) {
        alert("You are dead, GAME OVER!!!");
        restartGame(); // 调用重新开始游戏的函数
    }
}

function self_collision() {
    for (var i = 0; i < snakeCount - 1; i++) {
        if (snake[snakeCount - 1].x === snake[i].x && snake[snakeCount - 1].y === snake[i].y) {
            return true; // 蛇头碰到蛇身，返回true
        }
    }
    return false; // 没有碰到蛇身，返回false
}

function restartGame() {
    // 重置蛇的位置和长度
    snake = [];
    snakeCount = 6;
    for (var k = 0; k < snakeCount; k++) {
        snake[k] = { x: k * 15, y: 0 };
    }
    // 重置食物的位置
    addfood();
    // 重置游戏状态
    togo = 0;
    paused = false;
    // 重置分数
    score = 0;
    // 更新按钮文本
    pauseButton.textContent = "暂停游戏";
    // 清除画布并重新绘制
    ctx.clearRect(0, 0, 900, 600);
    drawtable();
}

function drawScore() {
    ctx.fillStyle = "black";
    ctx.font = "20px Arial";
    ctx.fillText("Score: " + score, 10, 30); // 在画布的左上角显示分数
}

document.onkeydown = function (e) {

    keydown(e);
};

var pauseButton = document.getElementById("pauseButton");
pauseButton.addEventListener("click", function () {
    paused =!paused;
    if (paused) {
        pauseButton.textContent = "继续游戏";
    } else {
        pauseButton.textContent = "暂停游戏";
    }
});

window.onload = function () {
    drawtable(); // 绘制初始分数，仅绘制初始界面，不开始游戏逻辑
};

var startButton = document.getElementById("startButton");
startButton.addEventListener("click", function () {
    // 先清除之前的定时器
    if (moveInterval) {
        clearInterval(moveInterval);
    }
    // 重置蛇的位置和长度
    snake = [];
    snakeCount = 6;
    for (var k = 0; k < snakeCount; k++) {
        snake[k] = { x: k * 15, y: 0 };
    }
    // 重置食物的位置
    addfood();
    // 重置游戏状态
    togo = 0;
    paused = false;
    // 重置分数
    score = 0;
    start();
    moveInterval = setInterval(move, 150);
});