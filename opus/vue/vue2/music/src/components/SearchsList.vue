<template>
  <li @click="ovoshow(item)">
    <h3>{{ item.name }}</h3>
    <div class="songs-list-info">
      <span class="sq">SQ</span>

      <div class="over">
        <span v-for="(ovo, index) in item.artists" :key="index" class="oper">
          {{ ovo.name }}
          <span v-if="index < item.artists.length - 1">/</span>
        </span>
      </div>

      <span class="album">-{{ item.album.name }}</span>
    </div>
    <div class="icon-play">
      <span
        v-if="currentSongId !== item.id"
        class="play iconfont icon-bofang"
      ></span>
      <div v-else class="anima" :class="{ playing: playing }">
        <span></span><span></span><span></span><span></span>
      </div>
    </div>
  </li>
</template>




<script>
export default {
  props: {
    item: Object,
    currentSongId: Number,
    playing: Boolean,
  },
  methods: {
    ovoshow(item) {
      console.log(666, "search", item);
      this.$emit("play-this-song", item);
    },
  },
};
</script>

<style lang="less" scoped>
@import "../assets/css/icon.css";

li {
  border-bottom: 1px solid #e8e8e8;
  padding: 10px;
  position: relative;

  h3 {
    font-size: 20px;
  }

  .songs-list-info {
    display: flex;
    align-items: center;
    font-size: 14px;
    color: #999;

    .over {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .sq {
      font-size: 6px;
      padding: 1px;
      font-weight: bold;
      color: red;
      border: 1px solid red;
      margin-right: 5px;
    }
  }

  .album {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .icon-play {
    @keyframes xxx {
      0% {
        transform: scaleY(1);
      }
      100% {
        transform: scaleY(0);
      }
    }
    .play {
      font-size: 30px;
      position: absolute;
      bottom: 14px;
      right: 14px;
      color: #686565;
      background-color: white;
    }

    .anima {
      width: 22px;
      height: 22px;
      display: flex;
      justify-content: space-around;
      position: absolute;
      bottom: 14px;
      right: 14px;
      // background-color: antiquewhite;
      span {
        display: block;
        width: 15%;
        height: 100%;
        background-color: red;
        animation: xxx 0.8s linear 0;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        transform-origin: bottom;
        animation-play-state: paused;
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
      }

      &.playing {
        span {
          animation-play-state: running;
        }
      }
    }
  }
}
</style>