<template>
  <div class="main">
    <div class="title">
      <h2>编辑推荐</h2>
    </div>
    <ul class="remusiclist">
      <ReMusicList
        v-for="item in remusiclist.slice(0, 6)"
        :key="item.id"
        :item="item"
        :col="3"
      ></ReMusicList>
    </ul>
    <div class="title">
      <h2>最新音乐</h2>
    </div>
    <ul class="newsongs">
      <SongsList
        @play-this-song="$emit('play-this-song', item)"
        v-for="item in newsong"
        :key="item.id"
        :item="item"
      v-bind="$attrs"
      />
    </ul>
  </div>
</template>

<script>
import ReMusicList from "@/components/ReMusicList.vue";
import SongsList from "@/components/SongsList.vue";

export default {
  components: {
    ReMusicList,
    SongsList,
  },
  data: function () {
    return {
      newsong: [],
      remusiclist: [],
    };
  },
  methods: {},
  created: function () {
    // 获取推荐歌单
    this.axios.get("/personalized").then((res) => {
      this.remusiclist = res.data.result;
    });

    // 获取最新音乐
    this.axios.get("/personalized/newsong").then((res) => {
      console.log("最新音乐", res.data.result);
      this.newsong = res.data.result;
    });
  },
};
</script>

<style lang="less" scoped>
.main {
  height: 620px;
  overflow: hidden;
  overflow-y: auto;
  -ms-overflow-style: none;
  scrollbar-width: none;

  .title {
    margin: 20px 0;
    border-left: 2px solid red;

    h2 {
      padding-left: 10px;
    }
  }

  .remusiclist {
    display: flex;
    flex-wrap: wrap;
    list-style: none;
    justify-content: space-around;
  }
}
</style>