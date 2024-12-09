<template>
  <div class="modal" v-if="isVisible">
    <div class="modal-content">
      <span class="close" @click.stop="close">&times;</span>
      <h2 style="margin: 10px">歌单</h2>
      <ul>
        <li v-for="song in ovosong" :key="song.id" class="llli">
          <span>
            {{ song.name }}
          </span>
          <span>
            <button @click.stop="playovo(song)">播放</button>
            <button @click.stop="ovodel(song.id)">X</button>
          </span>
        </li>
      </ul>
    </div>
  </div>
</template>
  
  
  <script>
export default {
  props: ["ovosong"],
  data() {
    return {
      isVisible: false,
    };
  },
  methods: {
    ovodel() {
      this.$emit("ovodel");
    },
    playovo(song) {
      this.$emit("play-this-songsong", song);
      console.log(song);
    },
    open() {
      this.isVisible = true;
    },
    close() {
      this.isVisible = false;
    },
  },
  mounted() {
    console.log("currentSong", this.currentSong);
  },
};
</script>
<style lang="less" scoped>
.llli {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: #f9f9f9; /* 淡灰色背景 */
  padding: 10px 15px;
  margin: 5px 0;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  transition: background 0.3s, transform 0.2s;

  &:hover {
    background: #f1f1f1;
    transform: translateY(-2px);
  }

  > span {
    font-size: 16px;
    font-weight: 500;
    color: #333;

    &:last-child {
      display: flex;
      gap: 10px;

      button {
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: background 0.3s, color 0.3s;

        &:first-child {
          background: #6a5acd; /* 紫色 */
          color: white;

          &:hover {
            background: #5a4bb0; /* 深紫色 */
          }
        }

        &:last-child {
          background: #9932cc; /* 浅紫色 */
          color: white;

          &:hover {
            background: #7e29aa; /* 深浅紫色 */
          }
        }
      }
    }
  }
}

.modal {
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6); /* 半透明黑色背景 */
}

.modal-content {
  background: #ffffff; /* 纯白背景 */
  border-radius: 12px;
  padding: 20px;
  width: 80%;
  max-width: 600px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
  animation: fadeIn 0.3s ease;

  h2 {
    font-size: 20px;
    color: #333;
    margin-bottom: 15px;
    text-align: center;
  }

  ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
}

.close {
  font-size: 1.5em;
  font-weight: bold;
  color: #999;
  cursor: pointer;
  position: absolute;
  top: 15px;
  right: 20px;
  transition: color 0.3s;

  &:hover {
    color: #333;
  }
}

/* 动画效果 */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
</style>
