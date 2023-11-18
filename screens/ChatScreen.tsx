import React from 'react';
import {View, Text} from 'react-native';
import type {NativeStackScreenProps} from '@react-navigation/native-stack';
import {NavigationParamList} from '../types';

type Props = NativeStackScreenProps<NavigationParamList, 'ChatScreen'>;
const ChatScreen = ({route}: Props) => {
  return (
    <View>
      <Text>{route.params.threadId}</Text>
      <Text>{route.params.message}</Text>
    </View>
  );
};

export default ChatScreen;
