import {NativeStackNavigationProp} from '@react-navigation/native-stack';

export type NavigationParamList = {
  MainApp: {
    threadId: string;
    threadName: String;
    message: String;
  };
  Contacts: {};
  ChatScreen: {
    threadId: string;
    threadName: string;
    message: string;
  };
  Chats: {
    threadId: string;
    threadName: string;
  };
};

export type StackNavigation = NativeStackNavigationProp<NavigationParamList>;

// TODO: Modify RootStackParamList to reflect ts message type
