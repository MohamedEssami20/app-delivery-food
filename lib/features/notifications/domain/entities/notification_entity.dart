class NotificationEntity {
  final String id;
  final String title;
  final String body;
  final String timeAgo;
  final bool isNew;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.timeAgo,
    required this.isNew,
  });
}
