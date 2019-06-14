/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import { StyleSheet, Image, View} from 'react-native';

const imageUrl = 'https://img.alicdn.com/imgextra/i2/2200775048178/O1CN01hpd2MS2AHZYcvYjXu_!!2200775048178.jpg';

export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
       <Image style={{width: 80, height: 80}} source={{ uri: imageUrl }}></Image>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
