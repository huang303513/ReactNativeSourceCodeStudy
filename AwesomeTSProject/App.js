import React, {useCallback, useState} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';

import {
  Header,
  Colors,
} from 'react-native/Libraries/NewAppScreen';

import Button from './Button';



const App: () => React$Node = () => {

  const [time, setTime] = useState('');

  const onClickButtonOne = useCallback((e) => {
    const { time } = e.nativeEvent;
    setTime(time);
  }, [setTime]);

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ScrollView
          contentInsetAdjustmentBehavior="automatic"
          style={styles.scrollView}>
          <Header />

          <Button style={styles.buttonOne} onClick={onClickButtonOne} title={'标题1'}></Button>
          <Text style={styles.footer}>{time}</Text> 
        </ScrollView>
      </SafeAreaView>
    </>
  );
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  buttonOne: {
    width: 100,
    height: 50,
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'left',
  },
});

export default App;
