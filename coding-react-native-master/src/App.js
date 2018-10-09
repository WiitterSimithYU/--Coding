import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import TabNavigator from './Base/Tabbar';

// 屏蔽 isMounted(...) 黄色警告
import { YellowBox } from 'react-native';
YellowBox.ignoreWarnings(['Warning: isMounted(...) is deprecated', 'Module RCTImageLoader']);

// 初始化
export default class App extends Component {
  render() {
    return (
      <TabNavigator/>
    );
  }
}
