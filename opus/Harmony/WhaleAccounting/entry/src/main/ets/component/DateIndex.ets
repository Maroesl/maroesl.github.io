const date = new Date();
const year = date.getFullYear();
const month = (date.getMonth() + 1).toString().padStart(2, '0');
const day = date.getDate().toString().padStart(2, '0');
let str = `${year}年${month}明细`;

@Component
struct DateIndex {
  @State message: string = 'Hello World';

  build() {
    // 日期
    Row() {
      // Image('icon/zuo.webp').width(15)
      Text(str).fontColor('#ff64ac81').margin({ left: 5, right: 5 })
      // Image('icon/you.webp').width(15)
    }.margin(20)

  }
}

export default DateIndex;