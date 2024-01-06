import { useEffect } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { StatusBar } from 'expo-status-bar';

// order matters here
import "react-native-polyfill-globals/auto";

import { useGno } from './src/hooks/use-gno';

// Polyfill async.Iterator. For some reason, the Babel presets and plugins are not doing the trick.
// Code from here: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-3.html#caveats
(Symbol as any).asyncIterator =
  Symbol.asyncIterator || Symbol.for("Symbol.asyncIterator");

export default function App() {

  const gno = useGno();

  useEffect(() => {
    gno
      .render("gno.land/r/demo/boards", "gnonative/1")
      .then((res) => console.log(res))
      .catch((err) => console.log(err));
  }, []);

  return (
    <View style={styles.container}>
      <Text>Open up App.tsx to start working on your app!</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
