import { View, Text, TouchableOpacity } from 'react-native';
import { Link, Stack } from 'expo-router';

export default function NotFoundScreen() {
  return (
    <>
      <Stack.Screen options={{ title: 'Oops!' }} />
      <View className="flex-1 items-center justify-center p-5">
        <Text className="text-xl font-bold mb-4">This screen doesn't exist.</Text>
        
        <Link href="/" asChild>
          <TouchableOpacity className="crm-button">
            <Text className="text-white font-semibold">Go to home screen</Text>
          </TouchableOpacity>
        </Link>
      </View>
    </>
  );
}