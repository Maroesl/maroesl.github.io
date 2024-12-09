<template>
  <div>
    <div class="ovoipt">
      <input
        type="text"
        v-model="question"
        placeholder="搜索歌曲、歌手、专辑"
        @input="search"
      />
      <span class="iconfont icon-search"></span>
    </div>
    <div v-if="loading">正在搜索...</div>
    <div v-else>
      <p>{{ tips }}</p>
      <ul>
        <!-- <SongsList
          v-for="item in sortedSongs.slice(0, 30)"
          :key="item.id"
          :item="item"
          @play-this-song="$emit('play-this-song', item)"
        /> -->

        <li v-for="song in sortedSongs" :key="song.id">{{ song.name }}</li>
      </ul>
    </div>
  </div>
</template>


<script>
import axios from "axios";
import _ from "lodash";
// import SongsList from "@/components/SongsList";
export default {
//   components: {
//     SongsList,
//   },
  data() {
    return {
      question: "",
      result: null,
      loading: false,
    };
  },
  computed: {
    tips() {
      return this.question ? "搜索结果" : "请输入你要查询的歌曲";
    },
        sortedSongs() {
        if (this.result && this.result.songs) {
            return this.result.songs
            .slice()
            .sort((a, b) => a.name.localeCompare(b.name));
        }
      return [];
    },
  },
  methods: {
    search() {
      if (this.question) {
        this.loading = true;
        this.debouncedGetAnswer(this.question);
      }
    },
    getAnswer(question) {
      axios
        .get("https://apis.netstart.cn/music/search", {
          params: {
            keywords: question,
          },
        })
        .then((response) => {
          this.result = response.data.result;
          console.log(this.result);
          
        })
        .finally(() => {
          this.loading = false;
        });
    },
  },
  created() {
    this.debouncedGetAnswer = _.debounce(this.getAnswer, 500);
  },
};
</script>

<style lang="less" scoped>
@import "../assets/css/icon.css";

.ovoipt {
  position: relative;
  display: flex;
  justify-content: center;
  margin-top: 10px;

  input {
    border: none;
    border-radius: 30px;
    width: 95%;
    height: 30px;
    background-color: #9999993b;
    padding-left: 30px;

    &[type="text"]::placeholder {
      color: #9b9b9b83;
    }
  }

  span {
    position: absolute;
    left: 20px;
    top: 7px;
    color: #888;
  }
}
</style>
