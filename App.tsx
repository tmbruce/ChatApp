import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {MainStackNavigator} from './navigation/AppNavigator';
import RustModule from './rust_module/rust_module';

import {store} from './redux/store';
import {Provider} from 'react-redux';

const App = () => {
  async function add() {
    let result = await RustModule.add_numbers(1, 2);
    return result;
  }
  console.log(add());
  return (
    <Provider store={store}>
      <NavigationContainer>
        <MainStackNavigator />
      </NavigationContainer>
    </Provider>
  );
};

export default App;