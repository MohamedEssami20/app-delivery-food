import 'package:app_delivey_food/features/notifications/domain/entities/notification_entity.dart';

// dummy notifications data matching the Figma design;
List<NotificationEntity> getDummyNotifications() {
  return [
    const NotificationEntity(
      id: '1',
      title: 'Order Out for Delivery!',
      body: 'Your food is on the move! Track your order for real-time updates.',
      timeAgo: '5 mins ago',
      isNew: true,
    ),
    const NotificationEntity(
      id: '2',
      title: 'Your Order is Confirmed!',
      body:
          'Thanks for ordering! Your delicious meal is being prepared and will be on its way soon.',
      timeAgo: '22 mins ago',
      isNew: true,
    ),
    const NotificationEntity(
      id: '3',
      title: 'Rate Your Order',
      body:
          'How did we do? Let us know by rating your recent order and sharing your feedback.',
      timeAgo: '1 day ago',
      isNew: false,
    ),
    const NotificationEntity(
      id: '4',
      title: 'Hungry? Try Our New Pizza Specials!',
      body:
          'Check out the latest additions to our menu and satisfy your cravings!',
      timeAgo: '2 days ago',
      isNew: false,
    ),
    const NotificationEntity(
      id: '5',
      title: "Don't Miss Out: Special Offer Just for You!",
      body: 'Get 10% off your next order with code SAVE10. Limited time only!',
      timeAgo: '2 hours ago',
      isNew: false,
    ),
  ];
}
