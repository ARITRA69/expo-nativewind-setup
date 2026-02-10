import '@/global.css';
import { themes } from '@/utils/theme';
import { Stack } from 'expo-router';
import { VariableContextProvider } from 'nativewind';
import { useColorScheme } from 'react-native';

export default function RootLayout() {
  const colorScheme = useColorScheme();

  return (
    <VariableContextProvider value={themes[colorScheme === 'dark' ? 'dark' : 'light']}>
      <Stack screenOptions={{ headerShown: false }} />
    </VariableContextProvider>
  );
}
