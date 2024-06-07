import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { logEventSKAdNetwork } from 'react-native-skadnetwork';

const events = {
  SIGNUP: 0,
  LEVEL_1: 1,
  LEVEL_2: 2,
  AD_VIEW: 3,
  PURCHASE: 4,
  INSTALL: 5,
};

export default function App() {
  const setLoggerSKAdnetwork = async () => {
    await logEventSKAdNetwork(events.PURCHASE);
  };

  React.useEffect(() => {
    setLoggerSKAdnetwork();
  }, []);

  return (
    <View style={styles.container}>
      <Text>Initialize IOS SKAdnetwork</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
