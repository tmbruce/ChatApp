import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import Navigator from './navigation/AppNavigator';
import RustModule from './rust_module';

import {store} from './redux/store';
import {Provider} from 'react-redux';

const App = () => {
  RustModule.addNumbers(1, 2).then((result: number) => {
    console.log(result);
  });
  //   let result = await RustModule.addNumbers(1, 2);
  //   return result;
  // }
  // console.log(add());
  return (
    <Provider store={store}>
      <NavigationContainer>
        <Navigator />
      </NavigationContainer>
    </Provider>
  );
};

export default App;
