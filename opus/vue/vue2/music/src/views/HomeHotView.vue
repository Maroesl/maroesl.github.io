<template>
    <div>
        <div class="top">
            <span></span>
            <div class="time"> 更新日期：{{ currentDate }}</div>
        </div>
        <ol style="height: 470px;">
            <SongsList v-for="item in hotsongs.slice(0, 30)" :key="item.id" :item="item" @play-this-song="$emit('play-this-song',item)"/>
        </ol>

    </div>
</template>

<script>
import SongsList from "@/components/SongsList.vue";
export default {
    components: {
        SongsList,
    },
    data: function () {
        return {
            hotsongs: [],
        }
    },
    computed: {
        // 计算属性来获取当前日期
        currentDate() {
            const now = new Date(); // 获取当前日期
            const month = now.getMonth() + 1; // 获取月份，月份从0开始，所以加1
            const day = now.getDate(); // 获取日期
            // 返回格式化的日期字符串，例如 "11月19日"
            return `${month}月${day}日`;
        }
    },
    created: function () {
        // 获取热歌榜
        this.axios.get("/playlist/detail?id=3778678").then((res) => {
            console.log(res.data.playlist.tracks);
            this.hotsongs = res.data.playlist.tracks;
        });


    },

}
</script>

<style lang="less" scoped>
div {
    overflow: hidden;
    height: 682px;

    .top {
        background: url('../assets/img/hot_music_bg_3x.jpg') no-repeat;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        width: 100%;
        height: 150px;
        position: relative;

        .time {
            color: white;
            position: absolute;
            top: 105px;
            left:25px;
            height: 30px;
            font-size: 15px;
        }

        span {
            background: url(../assets/img/index_icon_2x.png) no-repeat -30px -30px;
            width: 190px;
            height: 90px;
            background-size: 200px;
            position: absolute;
            top: 15px;
            left: 25px;
        }

    }

    ol {
        height: 764px;
        overflow: hidden;
        overflow-y: auto;
        -ms-overflow-style: none;
        scrollbar-width: none;
    }
}
</style>