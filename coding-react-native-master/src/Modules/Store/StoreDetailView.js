import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native';
import { ScreenWidth, countcoordinatesX, countcoordinatesY, ColorLine } from '../../Define/PublicMacros';

class StoreDetailCell extends Component {
  render() {
    return (
      <View style={styles.cell}>
        <View style={styles.content}>
          <View style={{flex: 1}}>
            <Text style={styles.top}>asdasd</Text>
            <Text style={styles.center}>asdasdasdasdasdasdasdasdasdasd</Text>
          </View>
          <Text style={styles.bottom}>asdasd</Text>
        </View>
        <Image style={styles.icon}/>
        <View style={styles.line}/>
      </View>
    );
  }
}


export default class StoreDetailView extends Component {
  render() {
    return (
      <View style={styles.container}>
        <StoreDetailCell/>
        <StoreDetailCell/>
        <StoreDetailCell/>
        <StoreDetailCell/>
      </View>
    );
  }
}

var row = 1;
var padding = countcoordinatesX(5);
var cellW = ( ScreenWidth - padding * (row - 1)) / row;
var cellH = cellW / 5 * 3 + 20;

const styles = StyleSheet.create({
  container: {
    alignItems: 'flex-start',
    justifyContent: 'space-between',
    flexDirection: 'row',
    width: ScreenWidth,
    flexWrap: 'wrap',
    backgroundColor: '#F5FCFF',
  },
  cell: {
    width: ScreenWidth,
    height: ScreenWidth / 3,
    backgroundColor: 'red',
    flexDirection: 'row',
  },
  content: {
    flex: 1,
    backgroundColor: 'white',
    paddingLeft: countcoordinatesX(15),
    paddingRight: countcoordinatesX(15),
    paddingTop: countcoordinatesX(10),
    paddingBottom: countcoordinatesX(10),
  },
  top: {

  },
  center: {

  },
  bottom: {
    bottom: 0,
    backgroundColor: 'red',
  },
  icon: {
    width: ScreenWidth / 3 / 5 * 4,
    height: ScreenWidth / 3,
    backgroundColor: 'red',
  },
  line: {
    width: ScreenWidth,
    height: 1,
    backgroundColor: ColorLine,
    position: 'absolute',
    bottom: 0,
  }
});
