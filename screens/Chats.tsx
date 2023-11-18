import React from 'react';
import {FlatList, View} from 'react-native';
import {useSelector} from 'react-redux';
import {RootState} from '../redux/store';

import ChatThreadCard from '../components/ChatThreadCard';
import {ChatThreadCard as ChatThreadCardType} from '../types';

const Chats = () => {
  const {threads} = useSelector((state: RootState) => state.threads);
  return (
    <View>
      <FlatList
        data={threads}
        keyExtractor={(item: ChatThreadCardType, _: number) =>
          item.threadId.toString()
        }
        renderItem={({item}) => <ChatThreadCard chatThread={item} />}
      />
    </View>
  );
};

export default Chats;
