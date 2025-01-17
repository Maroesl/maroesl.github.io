import { ControlSearchComponent } from '../view/ControlSearchComponent';
import { BottomItem, ControlSearchParameter } from '../viewmodel/ControlSearchParameter';

@Entry
@Component
struct PageComponentsCard {
  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';
  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';
  /*
   * The message.
   */
  readonly MESSAGE: string = 'add detail';

  private bottomItemList: BottomItem[] = [
    {
      formLinkParam: {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
          message: this.MESSAGE
        }
      },
      title: "今日细明",
      icon: 'icon/jinriximing.webp'
    },
    {
      formLinkParam: {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
          message: this.MESSAGE
        }
      },
      title: '钱包',
      icon: 'icon/qianbao.webp'
    },
    {
      formLinkParam: {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
          message: this.MESSAGE
        }
      },
      title: '预算',
      icon: 'icon/yusuan.webp'
    },
    {
      formLinkParam: {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
          message: this.MESSAGE
        }
      },
      title: "日历",
      icon: "icon/rili.webp"
    }
  ];
  @State controlSearchParameter: ControlSearchParameter = new ControlSearchParameter('', Color.White,
    Color.White, { color: Color.White }, BlurStyle.COMPONENT_ULTRA_THIN, this.bottomItemList, '',
    $r('app.media.ic_widget_background'), ImageSize.Cover, BlurStyle.COMPONENT_ULTRA_THIN, undefined,
    undefined, undefined, undefined, undefined);

  build() {
    FormLink({
      action: this.ACTION_TYPE,
      abilityName: this.ABILITY_NAME,
      params: {
        message: this.MESSAGE
      }
    }) {
      Row() {
        ControlSearchComponent({ controlSearchParameter: this.controlSearchParameter })

      }
    }
  }
}