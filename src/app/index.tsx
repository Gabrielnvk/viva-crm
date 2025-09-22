import { View, Text, TouchableOpacity } from 'react-native';
import { Link } from 'expo-router';

export default function WelcomeScreen() {
  return (
    <View className="flex-1 bg-gray-50 justify-center items-center p-6">
      <View className="crm-card max-w-md w-full">
        <Text className="text-3xl font-bold text-center text-gray-900 mb-2">
          Welcome to Viva CRM
        </Text>
        <Text className="text-gray-600 text-center mb-8">
          Manage your customer relationships with ease and efficiency
        </Text>
        
        <View className="space-y-4">
          <Link href="/sign-in" asChild>
            <TouchableOpacity className="crm-button">
              <Text className="text-white font-semibold">Sign In</Text>
            </TouchableOpacity>
          </Link>
          
          <Link href="/sign-up" asChild>
            <TouchableOpacity className="bg-gray-200 px-4 py-2 rounded-md">
              <Text className="text-gray-800 font-semibold text-center">Create Account</Text>
            </TouchableOpacity>
          </Link>
          
          <Link href="/(app)" asChild>
            <TouchableOpacity className="mt-4">
              <Text className="text-primary-600 text-center underline">
                Continue as Guest
              </Text>
            </TouchableOpacity>
          </Link>
        </View>
      </View>
    </View>
  );
}