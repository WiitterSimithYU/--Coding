import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  FlatList
} from 'react-native';
import { StatusBarHeight, ScreenWidth, countcoordinatesX } from '../../Define/PublicMacros';

export default class SearchSectionHeader extends Component {

  render() {
    return (
      <View style={styles.sectionHeader}>
        <Text>{this.props.name}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    paddingLeft: 10,
  },
  sectionHeader: {
    height: 40,
    width: ScreenWidth,
    justifyContent: 'center',
    paddingLeft: countcoordinatesX(10)
  }
});
