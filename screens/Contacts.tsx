import React from 'react';
import {View, Text, StyleSheet} from 'react-native';

const Contacts = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.content}>Contacts</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    fontSize: 20,
    fontWeight: 'bold',
  },
});

export default Contacts;
