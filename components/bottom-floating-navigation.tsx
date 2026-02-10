import { Button } from '@react-navigation/elements';
import { View } from 'react-native';

export const BottomFloatingNavigation = () => {
  return (
    <View>
      <Button action={{ type: 'push', payload: { screen: 'photos' } }}>Photos</Button>
      <Button action={{ type: 'push', payload: { screen: 'albums' } }}>Albums</Button>
    </View>
  );
};
