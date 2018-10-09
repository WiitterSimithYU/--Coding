import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  FlatList
} from 'react-native';
import { StatusBarHeight } from '../../Define/PublicMacros';

export default class Search extends Component {


  getView(width) {
    return (
      <View style={{width: width, height: 20, backgroundColor: 'red', marginRight: 20, marginTop: 10,}}/>
    )
  }

  render() {
    return (
      <View style={styles.container}>
        {this.getView(30)}
        {this.getView(50)}
        {this.getView(30)}
        {this.getView(50)}
        {this.getView(30)}
        {this.getView(50)}
        {this.getView(60)}
        {this.getView(30)}
        {this.getView(50)}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    paddingLeft: 10,
  }
});
