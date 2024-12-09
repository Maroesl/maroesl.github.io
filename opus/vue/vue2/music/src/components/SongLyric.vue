<template>
  <div class="song-lyric"  :class="{ playing: playing }" @click="$emit('ovovhange')">
    <ul
      class="list"
      :style="{
        marginTop:
          -1 *
            lyricElementsHeight
              .slice(0, currentLyricIndex)
              .reduce((total, num) => total + num, 0) +
          175 +
          'px',
      }"
    >
      <li
        :class="{ active: index === currentLyricIndex }"
        v-for="(item, index) in parsedLyric"
        :key="index"
        ref="lyricElements"
      >
        <span
          :style="{
            animationDuration:
              ((parsedLyric[index + 1]?.time || duration) - item.time) * 0.9 +
              's',
          }"
          >{{ item.text }}</span
        >
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    playing: Boolean,
    currentTime: Number,
    duration: Number,
  },
  data: function () {
    return {
      lyric: "",
      lyricElementsHeight: [],
    };
  },
  created: function () {
    this.axios
      .get("/lyric", {
        params: {
          id: this.$route.query.id,
        },
      })
      .then((res) => {
        // console.log(res.data.lrc.lyric);
        this.lyric = res.data.lrc.lyric;

        this.$nextTick(() => {
          console.log(this.$refs.lyricElements);
          this.lyricElementsHeight = this.$refs.lyricElements.map(
            (ele) => ele.offsetHeight
          );
        });
      });
  },
  computed: {
    currentLyricIndex: function () {
      return this.parsedLyric.findLastIndex((item) => {
        return item.time <= this.currentTime;
      });

      //   return this.currentTime;
    },
    parsedLyric: function () {
      return this.lyric
        .split("\n")
        .filter((o) => o)
        .map((item) => {
          var res = item.match(
            /\[(?<m>\d{2}):(?<s>\d{2}\.\d{2,3})\](?<str>.*)/i
          );
          // return res.groups;
          return {
            time: res.groups.m * 60 + parseFloat(res.groups.s),
            text: res.groups.str || "---",
          };
        });
    },
  },
};
</script>

<style lang="less" scoped>
@keyframes xxx {
  0% {
    background-position-x: 100%;
  }
  100% {
    background-position-x: 0%;
    // background-image: linear-gradient(to right, rgb(255, 128, 0) 49%, rgb(0, 195, 255) 51%);
    // color: transparent;
  }
}

.song-lyric {
  height: 300px;
  //   background-color: lightblue;
  background-image: linear-gradient(
    to bottom,
    transparent 0%,
    white 20%,
    white 80%,
    transparent 100%
  );
  background-clip: text;
  overflow: hidden;
  color: transparent;
  //
  .list {
    padding: 10px;
    transition: all 0.3s;

    li {
      span {
        font-size: 14px;
        line-height: 25px;
        display: inline-block;
        background-size: 200%;
        background-repeat: no-repeat;
        background-position-x: 100%;
        background-clip: text;

        // transition: background-position-x linear 0.3s;
        // transition-duration: ;
      }
      &.active {

        span {
          // color: red;
          font-size: 16px;
          line-height: 30px;
          //   background-image: linear-gradient(to right, blue 49%, red 51%);
          //   color: transparent;
          //   background-position-x: 0%;

          animation: xxx 3s linear;
          animation-play-state: paused;
          background-image: linear-gradient(
            to right,
            #b200ef 48%,
            rgb(0, 208, 255) 52%
          );
          color: transparent;
            text-shadow: 1px 1px 3px rgba(255, 255, 255, 0.185);
        }
      }
    }
  }

  &.playing {
    .list {
      li {
        span {
          animation-play-state: running;
        }
      }
    }
  }
}
</style>