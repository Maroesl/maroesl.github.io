<template>
    <div class="main">
        <div v-if="tips">{{ tips }}</div>
        <div v-else-if="details">
            <header :style="`background: url('${details.creator.backgroundUrl}') no-repeat center center;`">
                <div class="blur">
                    <div class="ovoimg">
                        <img :src="`${details.coverImgUrl}? imageView = 1 & type= webp & thumbnail=378x0`" alt="">
                        <span>{{ details.playCount }}</span>
                    </div>
                    <div class="text">
                        <h6>{{ details.name }}</h6>
                        <div class="creator">
                            <img :src="`${details.creator.avatarUrl}?imageView=1&amp;type=webp&amp;thumbnail=90x0`"
                                alt="">
                            <div class="name">{{ details.creator.nickname }}</div>
                        </div>
                    </div>
                </div>
            </header>



            <ol class="ovool">
                <div class="btn">
                    <button @click="$router.back()">返回</button>
                    <button>播放全部</button>
                </div>
                <SongsList @play-this-song="$emit('play-this-song',item)" v-for="item in details.tracks" :key="item.id" :item="item" />

             
            </ol>
        </div>
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
            tips: '',
            details: null,
        }
    },
    created() {
        if (this.$route.query.id) {
            this.axios.get('/playlist/detail', {
                params: { id: this.$route.query.id },
            }).then((response) => {
                this.details = response.data.playlist
                console.log('details', this.details);

            });
        } else {
            this.tips = '😄请求错误了，请刷新后再试试😄'
        }
    }
}
</script>

<style lang="less" scoped>
.main {
    height: 732px;
    overflow: hidden;
    overflow-y: auto;
    -ms-overflow-style: none;
    scrollbar-width: none;

    header {

        position: relative;
        width: 100%;
        height: 150px;
        overflow: hidden;

        .blur {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.3);
            z-index: 1;
            padding: 20px 10px;
            display: flex;

            .ovoimg {
                position: relative;
                width: 120px;


                img {
                    width: 100%;
                }

                span {
                    position: absolute;
                    right: 0;
                    top: 0;
                    color: #fff;
                    font-size: 10px;
                }
            }

            .text {
                margin: 0 10px;
                width: 60%;

                h6 {
                    color: #fff;
                    font-size: 20px;
                    display: -webkit-box;
                    -webkit-box-orient: vertical;
                    -webkit-line-clamp: 3;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: normal;
                }

                .creator {
                    margin-top: 5px;
                    display: flex;
                    align-items: center;

                    img {
                        width: 30px;
                        height: 30px;
                        border-radius: 50%;
                    }

                    .name {
                        color: #707070;
                        margin-left: 10px;
                    }
                }
            }

        }



    }

    .ovool{
        .btn{
            padding: 10px;
            border-bottom: 1px solid #9999993f;
            display: flex;
            justify-content: space-between;
        }
    }
}
</style>