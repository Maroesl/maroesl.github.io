<template>
  <div class="play-bar" @click="SongPage">
    <div class="custom-audio-player">
      <div class="ovoimg">
        <img
          :src="`${
            currentSong.picUrl ? currentSong.picUrl : currentSong.al.picUrl
          }?imageView=1&type=webp&thumbnail=378x0`"
          alt="歌曲封面"
        />
      </div>
      <div class="info">
        <div class="name" style="width: 42vw; overflow: hidden">
          <span>{{ currentSong.name }}</span>
          <span
            v-for="(ovo, index) in currentSong.song
              ? currentSong.song.artists
              : currentSong.ar"
            :key="index"
            class="oper"
          >
            {{ ovo.name }}
            <span
              v-if="
                (currentSong.song
                  ? currentSong.song.artists
                  : currentSong.ar) &&
                index <
                  (currentSong.song
                    ? currentSong.song.artists.length
                    : currentSong.ar.length) -
                    1
              "
              >/</span
            >
          </span>
        </div>
        <input type="range" id="seek-bar" ref="seekBar" value="0" max="100" />
        <audio
          id="audio-element"
          ref="audio"
          :src="audioSrc"
          loop
          autoplay
          @play="$emit('play', true)"
          @pause="$emit('pause', false)"
          @durationchange="$emit('durationchange', $event.target.duration)"
          @timeupdate="$emit('timeupdate', $event.target.currentTime)"
        ></audio>
      </div>
      <button
        id="play-pause-btn"
        ref="playPauseBtn"
        class="iconfont icon-bofang"
        @click.stop="togglePlayPause"
      ></button>

      <button
        class="iconfont icon-liebiao"
        @click.stop="handleListClick"
      ></button>

      <SongModal
        ref="modal"
        :ovosong="ovosong"
        @ovodel="$emit('ovodel')"
        @play-this-songsong="aaa"
      />
    </div>
  </div>
</template>

<script>
import SongModal from "@/components/SongModal.vue";

export default {
  components: {
    // SearchsList,
    SongModal,
  },
  props: {
    currentSong: Object,
    playing: Boolean,
    duration: Number,
    currentTime: Number,
    ovosong: Array,
  },

  data() {
    return {
      audio: null,
      playPauseBtn: null,
      seekBar: null,
      isHidden: false,
    };
  },
  computed: {
    audioSrc() {
      return `https://music.163.com/song/media/outer/url?id=${this.currentSong.id}.mp3`;
    },
  },
  mounted() {
    this.audio = this.$refs.audio;
    this.playPauseBtn = this.$refs.playPauseBtn;
    this.seekBar = this.$refs.seekBar;

    // 监听音频事件
    this.audio.addEventListener("loadedmetadata", this.setDuration);
    this.audio.addEventListener("timeupdate", this.updateSeekBar);
    this.audio.addEventListener("play", this.onAudioPlay);
    this.audio.addEventListener("pause", this.onAudioPause);

    // 拖动进度条改变播放位置
    this.seekBar.addEventListener("input", this.changeSeekPosition);
  },
  methods: {
    aaa(id) {
      console.log("===", id);
      this.$emit("play-this-songsong", id);
    },
    SongPage() {
      this.$router.push({
        path: "/songpage",
        query: {
          id: this.currentSong.id,
        },
      });
      this.$emit("rejectitem", this.playing, this.duration, this.currentTime);
      console.log(this.playing, this.duration, this.currentTime, this.isHidden);
    },
    togglePlayPause() {
      if (this.audio.paused) {
        this.audio.play();
      } else {
        this.audio.pause();
      }
    },
    onAudioPlay() {
      this.playPauseBtn.classList.remove("icon-bofang");
      this.playPauseBtn.classList.add("icon-zanting");
    },
    onAudioPause() {
      this.playPauseBtn.classList.remove("icon-zanting");
      this.playPauseBtn.classList.add("icon-bofang");
    },
    setDuration() {
      this.seekBar.max = Math.floor(this.audio.duration);
    },
    updateSeekBar() {
      this.seekBar.value = Math.floor(this.audio.currentTime);
    },
    changeSeekPosition() {
      this.audio.currentTime = this.seekBar.value;
    },
    handleListClick() {
      console.log("播放列表按钮被点击！");
      this.$refs.modal.open();
    },
    resetAudio() {
      if (!this.audio) return;

      this.audio.pause();
      this.seekBar.value = 0;
      this.audio.currentTime = 0;

      if (this.currentSong && this.currentSong.id) {
        this.audio.src = this.audioSrc;
        this.audio.load();
        this.audio.oncanplay = () => {
          this.audio.play().catch((error) => {
            console.error("播放失败:", error);
          });
        };
      }
    },
  },
  watch: {
    currentSong: {
      immediate: true,
      handler() {
        this.resetAudio();
      },
    },
  },
};
</script>
<style lang="less" scoped>
.play-bar {
  height: 74px;
  width: 100%;
  border-radius: 10px;
  position: fixed;
  bottom: 0;
  left: 0;
  background: linear-gradient(90deg, #4a90e2, #9013fe);
  box-shadow: 0px -2px 10px rgba(0, 0, 0, 0.2);
  display: flex;
  align-items: center;
  justify-content: center;

  .custom-audio-player {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
    width: 100%;
    max-width: 1200px;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    padding: 10px 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);

    .ovoimg {
      img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        border: 2px solid #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      }
    }

    .info {
      flex-grow: 1;
      margin-left: 10px;
      display: flex;
      flex-direction: column;

      .name {
        font-size: 16px;
        font-weight: 600;
        color: #333;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        margin-bottom: 5px;
      }

      input[type="range"] {
        -webkit-appearance: none;
        width: 100%;
        height: 6px;
        background: #d3d3d3;
        border-radius: 5px;
        outline: none;
        transition: background 0.3s;

        &::-webkit-slider-thumb {
          -webkit-appearance: none;
          appearance: none;
          width: 14px;
          height: 14px;
          border-radius: 50%;
          background: #4a90e2;
          cursor: pointer;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        &::-moz-range-thumb {
          width: 14px;
          height: 14px;
          border-radius: 50%;
          background: #4a90e2;
          cursor: pointer;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }
      }
    }

    button {
      background: none;
      border: none;
      font-size: 20px;
      color: #4a90e2;
      cursor: pointer;
      transition: color 0.3s;

      &.icon-bofang {
        color: #4a90e2;
      }

      &.icon-zanting {
        color: #9013fe;
      }

      &:hover {
        color: #9013fe;
      }
    }

    .icon-liebiao {
      font-size: 22px;
      color: #333;
      transition: color 0.3s;

      &:hover {
        color: #4a90e2;
      }
    }
  }
}
</style>
