import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native';
import { ScreenWidth, countcoordinatesX, countcoordinatesY, ColorLine } from '../../Define/PublicMacros';

export default class StoreSectionHeader extends Component {
  render() {
    return (
      <View style={styles.header}>
        <View style={styles.line}/>
        <Text style={styles.name}>sadads</Text>
        <Image style={styles.next}/>
        <View style={styles.bottomLine}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  header: {
    width: ScreenWidth,
    height: countcoordinatesY(40),
    backgroundColor: 'white',
    flexDirection: 'row',
    alignItems: 'center',
  },
  line: {
    width: 3,
    height: 20,
    backgroundColor: 'red'
  },
  name: {
    marginLeft: countcoordinatesX(10),
  },
  next: {
    width: 20,
    height: 20,
    backgroundColor: 'red',
    marginLeft: countcoordinatesX(10),
  },
  bottomLine: {
    width: ScreenWidth,
    height: 1,
    backgroundColor: ColorLine,
    position: 'absolute',
    bottom: 0,
  }
});
