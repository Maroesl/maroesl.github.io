import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {







  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  // onWindowStageCreate(windowStage: window.WindowStage): void {
  //   // Main window is created, set main page for this ability
  //   hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
  //
  //   windowStage.loadContent('pages/Index', (err) => {
  //     if (err.code) {
  //       hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
  //       return;
  //     }
  //     hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
  //   });
  // }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        return;
      }
      PersistentStorage.persistProp('expensesList', [
        { icon: 'icon/mifan.png', title: '餐饮' },
        { icon: 'icon/shangpin.png', title: '购物' },
        { icon: 'icon/riyong.png', title: '日用' },
        { icon: 'icon/jiaotong.png', title: '交通' },
        { icon: 'icon/shucai.png', title: '蔬菜' },
        { icon: 'icon/kafei_1.png', title: '饮品' },
        { icon: 'icon/shuiguo.png', title: '水果' },
        { icon: 'icon/lingshi.png', title: '零食' },
        { icon: 'icon/fushi.png', title: '服饰' },
        { icon: 'icon/waimai.png', title: '外卖' },
        { icon: 'icon/maicai.png', title: '买菜' },
        { icon: 'icon/yundong.png', title: '运动' },
        { icon: 'icon/yule.png', title: '娱乐' },
        { icon: 'icon/zhufang.png', title: '住房' },
        { icon: 'icon/dianpu.png', title: '社交' },
        { icon: 'icon/lipin.png', title: '礼物' },
        { icon: 'icon/lvxing.png', title: '旅行' },
        { icon: 'icon/kuaidi.png', title: '快递' },
        { icon: 'icon/dianying.png', title: '电影票' },
        { icon: 'icon/qiche.png', title: '汽车' },
        { icon: 'icon/xuexi.png', title: '学习' },
        { icon: 'icon/majiang.png', title: '麻将' },
        { icon: 'icon/zhuanzhang.png', title: '转账' },
        { icon: 'icon/yiliao.png', title: '医疗' },
      ]);
      PersistentStorage.persistProp('incomeList', [
        { icon: 'icon/mifan.png', title: '餐饮' },
        { icon: 'icon/shangpin.png', title: '购物' },
        { icon: 'icon/riyong.png', title: '日用' },
        { icon: 'icon/jiaotong.png', title: '交通' },
        { icon: 'icon/shucai.png', title: '蔬菜' },
        { icon: 'icon/kafei_1.png', title: '饮品' },
        { icon: 'icon/shuiguo.png', title: '水果' },
        { icon: 'icon/lingshi.png', title: '零食' },
      ]);
      PersistentStorage.persistProp('userAccount', [ ]);
      PersistentStorage.persistProp('AlluserArr', [{}]);
      PersistentStorage.persistProp('user',{});
      PersistentStorage.persistProp('Token', '');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}