import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import NavigationBar from '../../Utils/Util/NavigationBar/NavigationBar';
import { ScreenWidth } from '../../Define/PublicMacros';

export default class SetHeader extends Component {

  render() {
    return (
      <View style={styles.container}>
        <Text>Header</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#F5FCFF',
    width: ScreenWidth,
    height: ScreenWidth / 3,
    backgroundColor: 'red'
  }
});
