import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  FlatList
} from 'react-native';
import { StatusBarHeight, ScreenWidth, countcoordinatesX } from '../../Define/PublicMacros';

export default class SearchCell extends Component {

  render() {
    return (
      <View style={styles.container}>
        <Text>1231231</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: ScreenWidth,
    height: 40,
    paddingLeft: countcoordinatesX(10),
    justifyContent: 'center',
  }
});
