import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import KKNavigationItem from './KKNavigationItem';
import KKButton from '../KKButton/KKButton';
import { ScreenWidth, NavigationHeight, StatusBarHeight, countcoordinatesX, ColorBg } from '../../../Define/PublicMacros'

export default class NavigationBar extends Component {

  left = ()=>{
    return (
      <KKButton/>
    )
  }
  right = ()=>{
    return (
      <KKButton/>
    )
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.content}>
          {this.left()}
          <Text style={styles.title}>{this.props.name}</Text>
          {this.right()}
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: ScreenWidth, 
    height: NavigationHeight(),
    backgroundColor: ColorBg,
  },
  content: {
    width: ScreenWidth,
    height: 44,
    marginTop: StatusBarHeight(),
    alignItems: 'center',
    justifyContent: 'space-between',
    flexDirection: 'row',
    paddingLeft: 10,
    paddingRight: 10,
  },
  title: {
    color: 'white',
    fontSize: 16,
    fontWeight: '900',
  }
});
