<template>
    <li class="list" :class="{ col3: col === 3 }" @click="jumppage(item.id)" >
        <div class="imgovo">
            <img :src="`${item.picUrl}?imageView=1&type=webp&thumbnail=246x0`" alt="">
            <span style="font-size: 12px;">{{ formatToWan(item.playCount) }}</span>
        </div>
        <h5>{{ item.name }}</h5>
    </li>
</template>

<script>
export default {
    name: "ReMusicList",
    props: {
        item: Object,
        col: Number,
    },
    data: function () {
        return {

        }
    }, methods: {
        jumppage(id) {
            // 编程式导航
            this.$router.push({ path: "details", query: { id } });
        },
        formatToWan(value) {
            if (!value) return '0';
            const unit = '万';
            const num = value / 10000; 
            return `${num.toFixed(4)}${unit}`; 
        }
    }
}
</script>

<style lang="less" scoped>
.list {
    .imgovo {
        position: relative;
        list-style: none;
        flex-grow: 1;
        margin-bottom: 3px;

        img {
            width: 100%;
            display: block;
        }

        span {
            position: absolute;
            top: 0;
            right: 0;
            color: white;
        }
    }

    h5 {
        font-size: 14px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        /* 你想要显示的行数 */
        overflow: hidden;
        margin-bottom: 5px;

    }

    &.col3 {
        width: 30%;

        &:nth-child(3n + 2) {
            margin-left: 3px;
            margin-right: 3px;
        }
    }
}
</style>