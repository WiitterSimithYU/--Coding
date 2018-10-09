import React, {Component} from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image,
  Platform,
  TouchableOpacity
} from 'react-native';
import {StackNavigator, TabNavigator, addNavigationHelpers} from 'shimo-navigation';
import CardStackStyleInterpolator from 'react-navigation/src/views/CardStack/CardStackStyleInterpolator';

import Button    from './Button/Button';
import BackLeft  from './Back/BackLeft';
import BackRight from './Back/BackRight';

// 控件
import Store from '../Modules/Store/Store';
import Mine from '../Modules/Mine/Mine';
import Set from '../Modules/Set/Set';
import Channels from '../Modules/Channels/Channels';
import NoneThing from '../Modules/NoneThing/NoneThing';

import {HeavyTextColor, ThinTextColor, MediumBGColor, LightBGColor} from '../Define/PublicMacros';

const tabbar_home_n = require('../Resources/Images/tabbar_home_n.png');
const tabbar_home_s = require('../Resources/Images/tabbar_home_s.png');
const tabbar_discover_n = require('../Resources/Images/tabbar_discover_n.png');
const tabbar_discover_s = require('../Resources/Images/tabbar_discover_s.png');
const tabbar_add_n = require('../Resources/Images/tabbar_add_n.png');
const tabbar_add_h = require('../Resources/Images/tabbar_add_h.png');
const tabbar_article_n = require('../Resources/Images/tabbar_article_n.png');
const tabbar_article_s = require('../Resources/Images/tabbar_article_s.png');
const tabbar_mine_n = require('../Resources/Images/tabbar_mine_n.png');
const tabbar_mine_s = require('../Resources/Images/tabbar_mine_s.png');

// 导航栏高度
const navigationH = Platform.select({ios: 44, android: 44});
// 导航栏字体
const navigationFontSize = Platform.select({ios: 15, android: 15});
// tabbar高度
const tabBarH = Platform.select({ios: 54, android: 64});
// tabbar字体大小
const tabbarFontSize = Platform.select({ios: 10, android: 12});
// 是否手动返回
const gestures = Platform.select({ios: true, android: false});

class TabbarIcon extends Component {

  pushBookKeep() {
    const { navigate } = this.props.navigation;
    navigate("Bookkeep");
  }

  render() {
    return (
      <TouchableOpacity activeOpacity={1} 
                        onPress={()=>this.pushBookKeep()} 
                        disabled={this.props.width == 0 ? true : false}>
        <Image source={this.props.source} style={{
              height: this.props.width == 0 ? 25 : 60,
              width: this.props.width == 0 ? 25 : 60,
              // marginBottom: this.props.width,
              marginBottom: this.props.width == 0 ? 0 : -20,
        }}/>
      </TouchableOpacity>
    );
  }
}


/**
* 控制器设置
*
* screen: 控制器名称
* navTitle: navigation标题
* tabTitle: tabbar标题
* navFontSize: navigation字体大小
* tabIcon: tabbar图片
* tabSelectIcon: tabbar选中图片
* isBack: 是否有返回按钮
* isHide: 是否隐藏navigation
*/
controllerSetting = (screenName, navTitle, tabTitle, navFontSize, tabIcon, tabSelectIcon, isBack, isHide) => {
  // 隐藏导航栏
  if (isHide == true) {
    let iconW = tabTitle == '发布' ? 80 : 25;
    let isGesturesEnabled = (tabTitle == '发布' || tabTitle == '截图') ? false : gestures;
    return ({
      screen: screenName,
      navigationOptions: ({navigation, screenProps}) => ({
        header: null,
        gesturesEnabled: isGesturesEnabled,
        tabBarIcon: (({tintColor, focused}) => {
          return (
            <TabbarIcon source={!focused? tabIcon: tabSelectIcon} 
                        width={iconW == 80 ? 20 : 0}
                        navigation={navigation}/>
          )
        }),
        tabBarLabel: tabTitle,
      })
    })
  } 
  // 显示导航栏
  else {
    let iconW = tabTitle == '发布' ? 80 : 25;
    return ({
      screen: screenName,
      navigationOptions: ({navigation, screenProps}) => ({
        headerTitle: tabTitle == '发布' ? ' ' : navTitle,
        headerLeft: (isBack == true ? <BackLeft navigation={navigation}/> : <View/>),
        headerRight: (isBack == true ? <BackRight rightIcon={true}/> : <View/>),
        headerStyle: {
          backgroundColor: 'white',
          height: navigationH,
        }, 
        headerTitleStyle: {
          fontSize: navFontSize,
          color: 'green',
          alignSelf: 'center',
          fontWeight: '400',
        },
        screen: screenName,
        navigationOptions: ({navigation, screenProps}) => ({
          header: null,
          gesturesEnabled: isGesturesEnabled,
          tabBarIcon: (({tintColor, focused}) => {
            return (<Image source={!focused? tabIcon: tabSelectIcon} style={{
                height: 25,
                width: 25
              }}/>)
          }),
          tabBarLabel: tabTitle == '发布' ? ' ' : tabTitle,
          }),
          gesturesEnabled: gestures,
          tabBarIcon: (({tintColor, focused}) => {
            return (
              <TabbarIcon source={!focused? tabIcon: tabSelectIcon} 
                          width={iconW == 80 ? 20 : 0}
                          navigation={navigation}/>
            )
          }),
          tabBarLabel: tabTitle == '发布' ? ' ' : tabTitle,
      })
    })
  }
}


const MyTab = TabNavigator({
  
  Store: controllerSetting(Store, '首页', '首页', 14, tabbar_home_n, tabbar_home_s, false, true),
  Mine: controllerSetting(Mine, '我的', '我的', 14, tabbar_mine_n, tabbar_mine_s, false, true),
  Set: controllerSetting(Set, '设置', '设置', 14, tabbar_mine_n, tabbar_mine_s, false, true),
  // Details: controllerSetting(Details, '明细', '明细', navigationFontSize, tabBar_detail_n, tabBar_detail_s, false, true),
  // Chart: controllerSetting(Chart, '图表', '图表', navigationFontSize, tabBar_chart_n, tabBar_chart_s, false, true),
  // NoneThing: controllerSetting(NoneThing, '发布', '发布', navigationFontSize, tabBar_add_n, tabBar_add_h, false, false),
  // Find: controllerSetting(Find, '发现', '发现', navigationFontSize, tabBar_discover_n, tabBar_discover_s, false, true),
  // Mine: controllerSetting(Mine, '我的', '我的', navigationFontSize, tabbar_mine_n, tabbar_mine_s, false, true),
}, {
  tabBarPosition: 'bottom', // 设置tabbar的位置，iOS默认在底部，安卓默认在顶部。（属性值：'top'，'bottom')
  swipeEnabled: false,      // 是否允许在标签之间进行滑动。
  animationEnabled: false,  // 是否在更改标签时显示动画。
  lazy: true,               // 是否根据需要懒惰呈现标签，而不是提前制作，意思是在app打开的时候将底部标签栏全部加载，默认false,推荐改成true哦。
  initialRouteName: '',     // 设置默认的页面组件
  backBehavior: 'none',     // 按 back 键是否跳转到第一个Tab(首页)， none 为不跳转
  tabBarOptions: {
    inactiveTintColor: 'white',
    activeTintColor: 'white',
    inactiveBackgroundColor: 'white', 
    activeBackgroundColor: 'white',
    showIcon: true,
    showLabel: true, 
    style: {
      height: tabBarH,
      backgroundColor: 'white'
    }, 
    labelStyle: {
      fontSize: 12,
      paddingBottom: 5,
      color: HeavyTextColor
    }, 
    upperCaseLabel: false,
    indicatorStyle: {
      height: 0,
    }, 
  }
});


export default MyApp = StackNavigator({
  MyTab: {
    screen: MyTab
  },
  NoneThing: controllerSetting(NoneThing, '发布', '发布', navigationFontSize, tabbar_add_n, tabbar_add_h, false, false),
  Channels: controllerSetting(Channels, '发布', '发布', navigationFontSize, tabbar_add_n, tabbar_add_h, false, true),
  // Badge: controllerSetting(Badge, '徽章', '徽章', navigationFontSize, tabBar_chart_n, tabBar_chart_s, true, true),
  // Category: controllerSetting(Category, '类别设置', '类别设置', navigationFontSize, tabBar_chart_n, tabBar_chart_s, true, true),
  // Bookkeep: controllerSetting(Bookkeep, '发布', '发布', navigationFontSize, tabBar_add_n, tabBar_add_h, false, true),
  // Push: controllerSetting(Push, '定时提醒', '定时提醒', navigationFontSize, tabBar_chart_n, tabBar_chart_s, true, true),
  // Help: controllerSetting(Help, '帮助', '帮助', navigationFontSize, tabbar_mine_n, tabbar_mine_s, false, true),
  // About: controllerSetting(About, '关于鲨鱼笔记', '关于鲨鱼笔记', navigationFontSize, tabbar_mine_n, tabbar_mine_s, false, true),
  // Bills: controllerSetting(Bills, '账单', '账单', navigationFontSize, tabbar_mine_n, tabbar_mine_s, false, true),
  // Item: controllerSetting(Item, '账单', '账单', navigationFontSize, tabbar_mine_n, tabbar_mine_s, true, true),
  // Screenshots: controllerSetting(Screenshots, '截图', '截图', navigationFontSize, tabbar_mine_n, tabbar_mine_s, true, true),
  // AddCategory: controllerSetting(AddCategory, '添加支出类别', '添加支出类别', navigationFontSize, tabbar_mine_n, tabbar_mine_s, true, true),
}, {
  
});



