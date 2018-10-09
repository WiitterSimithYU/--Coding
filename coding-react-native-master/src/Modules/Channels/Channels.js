import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native';
import { ScreenWidth, ScreenHeight, StatusBarHeight, countcoordinatesY, countcoordinatesX } from '../../Define/PublicMacros';

export default class Channels extends Component {

  static navigationOptions = {
    mode: 'modal',
    gesturesEnabled: false
  };
  
  render() {
    return (
      <View style={[styles.container]}>
        <View style={styles.top}>
          <View style={styles.close}/>
          <Text style={styles.name}>全部频道</Text>
          <Image style={styles.close}/>
        </View>
        <Text>我的栏目</Text>
        <Text>点击添加更多栏目</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    position: 'absolute',
    left: 0,
    top: 0,
    width: ScreenWidth, 
    height: ScreenHeight,
    backgroundColor: '#F5FCFF',
    paddingTop: StatusBarHeight() + countcoordinatesY(20)
  },
  top: {
    width: ScreenWidth,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingLeft: countcoordinatesX(10),
    paddingRight: countcoordinatesX(10)
  },
  name: {
    fontSize: 16,
  },
  close: {
    width: 20,
    height: 20,
    backgroundColor: 'red',
  }
});
