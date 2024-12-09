<template>
    <div>
      <div class="ovoipt">
        <!-- 使用 v-model 绑定输入框的值，并监听回车键事件 -->
        <input type="text" placeholder="搜索歌曲、歌手、专辑" v-model="keywords" @keyup.enter="searchSongs" />
        <span class="iconfont icon-search"></span>
      </div>
  
      <ol>
        <SearchsList
          v-for="item in serchsongs"
          :key="item.id"
          :item="item"
          @play-this-song="$emit('play-this-song', item)"
        />
      </ol>
    </div>
  </template>
  
  <script>
  import SearchsList from "@/components/SearchsList";
  export default {
    components: {
      SearchsList,
    },
    data: function () {
      return {
        serchsongs: [],
        keywords: '', // 绑定输入框的值
      };
    },
    methods: {
      // 添加一个方法来处理搜索
      searchSongs() {
        // 确保 keywords 不为空再发起请求
        if (this.keywords.trim()) {
          this.axios.get(`/search?keywords=${this.keywords}`).then((res) => {
            if (res.data && res.data.result) {
              this.serchsongs = res.data.result.songs || [];
            } else {
              console.error('Unexpected response structure:', res.data);
            }
          }).catch((error) => {
            console.error('Error fetching data:', error);
          });
        } else {
          // 如果 keywords 为空，清空搜索结果
          this.serchsongs = [];
        }
      }
    },
    created: function () {
      // 可以在 created 钩子中调用 searchSongs 方法来获取初始数据
      this.searchSongs();
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
ol {
  height: 575px;
  overflow: hidden;
  overflow-y: auto;
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>