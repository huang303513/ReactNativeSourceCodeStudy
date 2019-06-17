/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import { StyleSheet, Image, View} from 'react-native';
import miaobiGif from './222.gif';

const gifSource = Image.resolveAssetSource(miaobiGif);
console.warn(JSON.stringify(gifSource));

const imageUrl = 'https://img.alicdn.com/imgextra/i2/2200775048178/O1CN01hpd2MS2AHZYcvYjXu_!!2200775048178.jpg';

export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
       {/* <Image style={{width: 80, height: 80}} source={{ uri: imageUrl }}></Image>
       <Image style={{width: 80, height: 80}} source={{ uri: imageUrl }}></Image>
       <Image style={{width: 80, height: 80}} source={{ uri: imageUrl }}></Image>
       <Image style={{width: 80, height: 80}} source={{ uri: imageUrl }}></Image>
       <Image style={{width: 80, height: 80}} source={miaobiGif}></Image> */}
       <Image style={{width: 80, height: 80}} source={{uri:'1'}}></Image>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'column',
    backgroundColor: '#F5FCFF',
  },
});
