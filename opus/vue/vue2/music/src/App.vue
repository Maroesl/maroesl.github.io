<template>
  <div id="app">
    <div v-if="$route.meta.showNav">
      <div class="top">
        <span class="iconfont icon-qiezi"></span>
        <span @click="ovoshow()">茄子音乐</span>
      </div>
      <nav>
        <router-link to="/">推荐音乐</router-link>
        <router-link to="/hot">热歌榜</router-link>
        <router-link to="/search">搜索</router-link>
      </nav>
    </div>
    <!-- <keep-alive :exclude="['SongDetail']"> -->
    <router-view
      :currentSongId="currentSong?.id"
      @play-this-song="playthissong($event)"
      :currentSong="currentSong"
      :playing="playing"
      :duration="duration"
      :currentTime="currentTime"
      @toggle-play="toggleplay"
      @change-play-time="changePlayTime($event)"
      @playbar-true="isPlayBarVisible = true"
    />
    <!-- </keep-alive> -->
    <!-- v-if="currentSong && !$route.meta.hidePlaybar" -->
    <PlayBar
      ref="audioovo"
      class="playbar"
      v-show="isPlayBarVisible"
      :currentSong="currentSong"
      :ovosong="ovosong"
      @play="play"
      @pause="pause"
      @durationchange="durationchange"
      @timeupdate="timeupdate"
      @click.native.stop="isPlayBarVisible = false"
      @ovodel="ovodel"
      @play-this-songsong="playthissongsong"
    />
  </div>
</template>

<script>
import PlayBar from "./components/PlayBar";
export default {
  name: "App",
  components: {
    PlayBar,
  },
  data: function () {
    return {
      currentSong: null,
      // {
      //   name: "曼陀罗华",
      //   picUrl:
      //     "http://p1.music.126.net/qHQleWDYNl8Ev_W4CjpL2A==/109951170121509486.jpg",
      //   song: {
      //     artists: [{ name: "Sasuke" }],
      //   },
      //   id: 2643535318,
      // },
      playing: null, // 这里定义 playing
      duration: 0, // 这里定义 duration
      currentTime: 0, // 这里定义 currentTime
      isPlayBarVisible: true, // 控制 PlayBar 显示的状态
      ovosong: [],
    };
  },
  methods: {
    playthissongsong(a) {
      this.currentSong = a;
    },
    playthissong(a) {
      console.log("播放歌曲", a);
      this.currentSong = a;
      let arrs = [...this.ovosong];
      const existingItemIndex = arrs.findIndex((song) => song.id === a.id);

      if (existingItemIndex === -1) {
        arrs.push(a);
      } else {
        arrs[existingItemIndex] = a;
      }

      this.ovosong = arrs;

      console.log("列表", this.ovosong);
    },
    ovodel(id) {
      const existingItemIndex = this.ovosong.findIndex(
        (song) => song.id === id
      );

      // 如果找到了，使用 splice 方法删除
      if (existingItemIndex !== -1) {
        this.ovosong.splice(existingItemIndex, 1);
      }

      console.log("更新后的列表", this.ovosong);
    },
    ovoshow() {
      console.log(666, this.currentSong);
    },
    toggleplay() {
      const audio = this.$refs.audioovo.$refs.audio; // 获取子组件的 audio 引用
      if (audio.paused) {
        audio.play(); // 如果当前是暂停状态，则播放
      } else {
        audio.pause(); // 如果当前是播放状态，则暂停
      }
    },
    changePlayTime(time) {
      this.$refs.audioovo.$refs.audio.currentTime = time;
    },
    play(ovo) {
      this.playing = ovo;
      // console.log(this.playing);
    },
    pause(ovo) {
      this.playing = ovo;
      // console.log(this.playing);
    },
    durationchange(ovo) {
      this.duration = ovo;
      // console.log(this.duration);
    },
    timeupdate(ovo) {
      this.currentTime = ovo;
      // console.log(this.currentTime);
    },
  },
  activated() {
    this.isPlayBarVisible = true; // 页面被激活时显示 PlayBar
  },
  created() {
    // 初始加载时设置默认歌曲
    if (!this.currentSong) {
      this.currentSong = {
        name: "暂无歌曲",
        picUrl:
          "https://p2.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=130y130",
        song: {
          artists: [{ name: "未知" }],
        },
      };
    }
  },
};
</script>

<style lang="less">
/* 基础重置样式 */
@import "./assets/css/icon.css";

body {
  font-family: "Arial", sans-serif;
  background-color: #f9f9f9;
}

#app {
  width: 375px;
  height: 800px;
  border: 1px solid black;
  position: relative;

  .top {
    padding: 20px 5px;
    background-color: #b200ef;
    color: white;
    font-size: 25px;

    .iconfont {
      font-size: 25px;
      margin: 0 10px;
    }
  }

  nav {
    display: flex;
    justify-content: space-around;
    padding-top: 10px;
    box-sizing: border-box;
    height: 40px;

    a {
      padding-bottom: 10px;
      text-decoration: none;
      outline: none;
      color: inherit;

      &:hover,
      &:focus,
      &:active {
        text-decoration: none;
        outline: none;
      }

      &:focus {
        color: red;
        border-bottom: 3px solid red;
      }
    }
  }
}
</style>
