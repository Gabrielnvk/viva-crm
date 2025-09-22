import { View, Text, ScrollView } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

export default function DashboardScreen() {
  const stats = [
    { title: 'Total Contacts', value: '1,234', icon: 'people', color: 'bg-blue-500' },
    { title: 'Active Deals', value: '56', icon: 'briefcase', color: 'bg-green-500' },
    { title: 'Pending Tasks', value: '23', icon: 'checkbox', color: 'bg-yellow-500' },
    { title: 'Revenue', value: '$125K', icon: 'cash', color: 'bg-purple-500' },
  ];

  const recentActivities = [
    { type: 'contact', message: 'New contact added: John Doe', time: '2 hours ago' },
    { type: 'deal', message: 'Deal closed: ABC Corp - $15K', time: '4 hours ago' },
    { type: 'task', message: 'Task completed: Follow up with XYZ Ltd', time: '1 day ago' },
    { type: 'meeting', message: 'Meeting scheduled with Jane Smith', time: '2 days ago' },
  ];

  return (
    <ScrollView className="flex-1 bg-gray-50">
      <View className="p-4">
        {/* Welcome Section */}
        <View className="mb-6">
          <Text className="text-2xl font-bold text-gray-900 mb-2">
            Welcome back! 👋
          </Text>
          <Text className="text-gray-600">
            Here's what's happening with your CRM today
          </Text>
        </View>

        {/* Stats Cards */}
        <View className="flex-row flex-wrap justify-between mb-6">
          {stats.map((stat, index) => (
            <View key={index} className="crm-card w-[48%] mb-4">
              <View className="flex-row items-center justify-between">
                <View>
                  <Text className="text-2xl font-bold text-gray-900">{stat.value}</Text>
                  <Text className="text-sm text-gray-600">{stat.title}</Text>
                </View>
                <View className={`p-3 rounded-full ${stat.color}`}>
                  <Ionicons name={stat.icon as any} size={24} color="white" />
                </View>
              </View>
            </View>
          ))}
        </View>

        {/* Recent Activities */}
        <View className="crm-card">
          <Text className="text-lg font-semibold text-gray-900 mb-4">
            Recent Activities
          </Text>
          <View className="space-y-3">
            {recentActivities.map((activity, index) => (
              <View key={index} className="flex-row items-start space-x-3 pb-3 border-b border-gray-100 last:border-b-0">
                <View className="p-2 bg-primary-100 rounded-full">
                  <Ionicons 
                    name={
                      activity.type === 'contact' ? 'person' :
                      activity.type === 'deal' ? 'briefcase' :
                      activity.type === 'task' ? 'checkbox' :
                      'calendar'
                    } 
                    size={16} 
                    color="#3b82f6" 
                  />
                </View>
                <View className="flex-1">
                  <Text className="text-gray-900 font-medium">{activity.message}</Text>
                  <Text className="text-gray-500 text-sm">{activity.time}</Text>
                </View>
              </View>
            ))}
          </View>
        </View>
      </View>
    </ScrollView>
  );
}