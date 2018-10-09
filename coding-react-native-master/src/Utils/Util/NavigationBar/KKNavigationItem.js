import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native';

export default class KKNavigationItem extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.name}>asdasdas</Text>
        <Image style={styles.image}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: 'white',
    flexDirection: 'row',
    alignItems: 'center',
  },
  name: {

  },
  image: {
    width: 30,
    height: 30,
    backgroundColor: 'red'
  }
});
