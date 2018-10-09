import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native';
import { ScreenWidth, countcoordinatesX, countcoordinatesY } from '../../Define/PublicMacros';

class StoreSummaryCell extends Component {
  render() {
    return (
      <View style={styles.cell}>
        <Image style={styles.icon}/>
        <Text style={styles.name}>asdasdasd</Text>
      </View>
    );
  }
}


export default class StoreSummaryView extends Component {
  render() {
    return (
      <View style={styles.container}>
        <StoreSummaryCell/>
        <StoreSummaryCell/>
        <StoreSummaryCell/>
        <StoreSummaryCell/>
        <StoreSummaryCell/>
        <StoreSummaryCell/>
      </View>
    );
  }
}

var row = 3;
var padding = countcoordinatesX(5);
var cellW = ( ScreenWidth - padding * (row - 1)) / row;
var cellH = cellW + countcoordinatesY(20);

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
    backgroundColor: 'red',
    width: cellW,
    height: cellH,
    marginBottom: countcoordinatesX(10),
  },
  icon: {
    flex: 1,
    backgroundColor: 'yellow'
  },
  name: {
    backgroundColor: 'purple',
    height: 20,
  }
});
