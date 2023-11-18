import React from 'react';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import {NavigationParamList} from '../types';

import Chats from '../screens/Chats';
import ChatScreen from '../screens/ChatScreen';

// import {useTranslation} from 'react-i18next';
const Tab = createBottomTabNavigator<NavigationParamList>();

const TabNavigator = () => {
  return (
    <Tab.Navigator>
      <Tab.Screen
        name="Chats"
        component={Chats}
        options={{
          headerTitleStyle: {alignSelf: 'flex-start'},
        }}
      />
    </Tab.Navigator>
  );
};

const Stack = createNativeStackNavigator<NavigationParamList>();

const Navigator = () => {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name="MainApp"
        component={TabNavigator}
        options={{
          headerShown: false,
        }}
      />
      <Stack.Screen
        name="ChatScreen"
        component={ChatScreen}
        options={({route}) => ({
          headerBackTitle: 'Chats',
          headerTitle: route.params.threadName as string,
          threadName: route.params.threadName as string,
        })}
      />
    </Stack.Navigator>
  );
};

export default Navigator;

// TODO:
// Additional setup for android required:
// https://reactnavigation.org/docs/getting-started#installing-dependencies-into-a-bare-react-native-project
// 'Add the highlighted code to the body of MainActivity Class'

// Add i18n support for language translation
// Type documentation:
// https://www.i18next.com/overview/typescript

// A nice simple idea for tab floating tab navigation:
// https://www.youtube.com/watch?v=gPaBicMaib4
