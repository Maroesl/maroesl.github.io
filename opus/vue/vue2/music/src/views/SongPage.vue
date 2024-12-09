<template>
  <div v-if="currentSong" class="song">
    <div class="comeback" @click="ovoback">返回</div>
    <div @click="ovovhange" class="abc" v-if="imgchange">
      <div class="ovoimg">
        <img
          class="alimg"
          :class="{ playing: playing }"
          style=""
          :src="`${
            currentSong.song ? currentSong.picUrl : currentSong.al.picUrl
          }?imageView=1&type=webp&thumbnail=378x0`"
          alt=""
        />
        <img class="shou" src="../assets/img/jiaopian2.png" alt="" />
      </div>
      <h2>
        {{ currentSong.song ? currentSong.song.name : currentSong.al.name }}

        <span><img class="like" src="../assets/img/like.png" alt="" /></span>
        <span><img class="chat" src="../assets/img/chat.png" alt="" /></span>
      </h2>
      <h4>
        <span
          v-for="(ovo, index) in currentSong.song
            ? currentSong.song.artists
            : currentSong.ar"
          :key="index"
          class="oper"
        >
          {{ ovo.name }}
          <!-- <router-link :to="{ name: 'ArtistDetail', params: { artistId: ovo.id } }">{{ ovo.name }}</router-link> -->
          <!--  未完成 -->
          <span
            v-if="
              currentSong.song && currentSong.song.artists
                ? currentSong.song.artists.length
                : currentSong.ar && currentSong.ar.length
                ? currentSong.ar.length
                : 0
            "
            >&nbsp;/&nbsp;</span
          > </span
        >&nbsp;&gt;
      </h4>
    </div>

    <SongLyric
      class="lyric"
      @ovovhange="ovovhange"
      v-else
      :currentTime="currentTime"
      :duration="duration"
      :playing="playing"
    />

    <div class="ovoipt">
      <div class="progress">
        <div
          class="mask"
          :style="{ width: (userValue / duration) * 100 + '%' }"
        ></div>
        <input
          type="range"
          style="width: 100%"
          min="0"
          :max="duration"
          v-model.number="userValue"
          @input="inputing = true"
          @change="
            inputing = false;
            $emit('change-play-time', userValue);
          "
        />
      </div>
      <div class="two-span">
        <div class="span">{{ currentTime | time2mmss }}</div>
        <div class="span">{{ duration | time2mmss }}</div>
      </div>
    </div>

    <div class="ovobtn">
      <span class="iconfont icon-shunxubofang"></span>
      <span class="iconfont icon-shangyishou"></span>
      <span
        class="iconfont"
        :class="playing ? 'icon-zanting' : 'icon-bofang1'"
        @click="$emit('toggle-play')"
      ></span>
      <span class="iconfont icon-xiayishou"></span>
      <span class="iconfont icon-liebiao"></span>
    </div>

    <!-- <div class="dance" :class="{ playing: playing }">
      <av-bars
        v-if="currentSong"
        caps-color="#FFF"
        :bar-color="['#f00', '#ff0', '#0f0']"
        canv-fill-color="#000"
        :caps-height="2"
        src="../../public/qwe.mp3"
      >
    
      </av-bars>
      <av-circle
      :outline-width="0"
      :progress-width="5"
      :outline-meter-space="5"
      :playtime="true"
      playtime-font="18px Monaco"
     
    ></av-circle>
    </div> -->
    <div class="dance" :class="{ playing: playing }">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</template>

<script>
import SongLyric from "@/components/SongLyric.vue";
// import qwe from "@/assets/css/qwe.mp3";
export default {
  components: {
    SongLyric,
  },
  props: {
    currentSong: Object,
    currentSongId: Number,
    playing: Boolean,
    currentTime: Number,
    duration: Number,
  },
  data: function () {
    return {
      song: null,
      userValue: this.currentTime,
      inputing: false,
      imgchange: true,
      // qwe: qwe,
    };
  },
  computed: {
    audioSrc() {
      return `https://music.163.com/song/media/outer/url?id=${this.currentSong.id}.mp3`;
    },
  },

  methods: {
    ovoback() {
      this.$router.go(-1);
      this.$emit("playbar-true");
    },
    ovovhange() {
      this.imgchange = !this.imgchange;
    },
  },
  mounted: function () {
    console.log(this.currentSong.id);
  },
  created: function () {
    // this.axios
    //   .get("/song/detail", {
    //     params: {
    //       ids: this.$route.query.id,
    //     },
    //   })
    //   .then((res) => {
    //     this.song = res.data.songs[0];
    //   });
  },
  watch: {
    currentTime: function (currentTime) {
      if (!this.inputing) {
        this.userValue = currentTime;
      }
    },
  },
  currentSong: {
    handler(newVal) {
      if (newVal) {
        console.log(
          "Generated URL:",
          `https://music.163.com/song/media/outer/url?id=${newVal.id}.mp3`
        );
      } else {
        console.log("currentSong is null or undefined:", newVal);
      }
    },
    immediate: true,
  },
};
</script>

<style lang="less" scoped>
@import "../assets/css/icon.css";

@keyframes rotate {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
@keyframes ovodance {
  0% {
    transform: scaleY(0);
  }
  50% {
    transform: scaleY(1.5); /* 增加放大效果 */
  }
  100% {
    transform: scaleY(0); /* 回到原始状态 */
  }
}

.song {
  padding: 20px;
  background: linear-gradient(to bottom, #535ea5, #0e3542);
  height: 100%;
  position: relative;

  .comeback {
    color: #9999996b;
  }

  h2 {
    font-size: 20px;
    color: rgba(255, 255, 255, 0.418);
    position: relative;

    span {
      img {
        width: 40px;
        opacity: 0.5;
      }

      .like {
        position: absolute;
        right: 66px;
        top: 5px;
      }

      .chat {
        position: absolute;
        right: 0;
        top: 5px;
      }
    }
  }

  h4 {
    color: rgba(255, 255, 255, 0.418);

    a {
      text-decoration: none;
      color: inherit;
      cursor: inherit;
    }
  }
  .lyric {
    height: 437px;
    margin: 40px 0;
    width: 100%;
    text-align: center;
  }
  .ovoipt {
    margin-top: 30px;
    .two-span {
      margin-top: 15px;
      display: flex;
      justify-content: space-between;
      font-size: 14px;
      color: rgba(255, 255, 255, 0.336);
    }
    .progress {
      position: relative;
      width: 100%;
      height: 1px;
      background: rgba(128, 128, 128, 0.37);
      .mask {
        position: absolute;
        bottom: 0;
        left: 0;
        height: 100%;
        background-color: rgb(255, 255, 255);
        z-index: 0;
      }

      input {
        position: absolute;
        top: 0;
        left: 0;
        z-index: 1;
        width: 100%;
        height: 100%;
        opacity: 0;
      }
    }
  }

  .ovoimg {
    margin: 70px auto;
    background: url("../assets/img/jiaopian.png");
    position: relative;
    width: 300px;
    height: 300px;
    border-radius: 50%;
    background-size: cover;
    background-position: center;

    .alimg {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      position: absolute;
      top: 50px;
      left: 50px;
      animation: rotate 60s linear;
      animation-iteration-count: infinite;
      animation-play-state: paused;
      &.playing {
        animation-play-state: running;
      }
    }

    .shou {
      position: absolute;
      top: -72px;
      left: 55px;
      width: 180px;
    }
  }

  .ovobtn {
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin-top: 40px;

    span {
      font-size: 40px;
      color: rgba(255, 255, 255, 0.534);

      &.icon-shunxubofang,
      &.icon-liebiao {
        font-size: 20px;
        color: rgba(255, 255, 255, 0.233);
      }
    }
  }
  .dance {
    width: 100%;
    height: 120px !important;
    display: flex;
    justify-content: center;
    position: absolute;
    bottom: 0;
    left: 0;
    align-items: flex-end;
    height: 100vh;

    span {
      display: inline-block;
      width: 10px;
      height: 80px;
      margin: 0 2px;
      background-color: #b200ef;
      animation: ovodance 3s linear infinite;
      transform-origin: bottom;
      animation-play-state: paused;

      &:nth-child(even) {
        background-color: rgb(0, 208, 255);
      }

      &:nth-child(1) {
        animation-delay: 0s;
      }
      &:nth-child(2) {
        animation-delay: -0.4s;
      }
      &:nth-child(3) {
        animation-delay: -0.2s;
      }
      &:nth-child(4) {
        animation-delay: -0.6s;
      }
      &:nth-child(5) {
        animation-delay: -1.2s;
      }
      &:nth-child(6) {
        animation-delay: -2s;
      }
      &:nth-child(7) {
        animation-delay: -0.8s;
      }
      &:nth-child(8) {
        animation-delay: -0s;
      }
      &:nth-child(9) {
        animation-delay: -0.1s;
      }
      &:nth-child(10) {
        animation-delay: -2.5s;
      }
      &:nth-child(11) {
        animation-delay: -1.8s;
      }
      &:nth-child(12) {
        animation-delay: -2s;
      }
      &:nth-child(13) {
        animation-delay: -0.6s;
      }
      &:nth-child(14) {
        animation-delay: -1.6s;
      }
      &:nth-child(15) {
        animation-delay: -2.6s;
      }
      &:nth-child(16) {
        animation-delay: -0.8s;
      }
      &:nth-child(17) {
        animation-delay: -1s;
      }
      &:nth-child(18) {
        animation-delay: -0.2s;
      }
      &:nth-child(19) {
        animation-delay: -0.6s;
      }
      &:nth-child(20) {
        animation-delay: -1.5s;
      }
      &:nth-child(21) {
        animation-delay: -2.8s;
      }
      &:nth-child(22) {
        animation-delay: -1.2s;
      }
      &:nth-child(23) {
        animation-delay: -0.6s;
      }
      &:nth-child(24) {
        animation-delay: -0.8s;
      }
      &:nth-child(25) {
        animation-delay: -0.4s;
      }
      &:nth-child(26) {
        animation-delay: -0s;
      }
    }

    &.playing {
      span {
        animation-play-state: running;
      }
    }
  }
}
</style>