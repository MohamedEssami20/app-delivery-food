import 'package:flutter/material.dart';
import '../helper/app_theme_helper.dart';

Widget buildMessageBubble({
  required BuildContext context,
  required String text,
  required bool isMe,
  String? imageUrl,
}) {
  final theme = AppThemeHelper(context);
  return Align(
    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.only(bottom: 24),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
      padding: EdgeInsets.symmetric(horizontal: isMe ? 20 : 16, vertical: isMe ? 20 : 16),
      decoration: BoxDecoration(
        color: isMe ? theme.colors.grey50 : theme.colors.grey0,
        border: isMe ? null : Border.all(color: theme.colors.grey200),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: Radius.circular(isMe ? 16 : 0),
          bottomRight: Radius.circular(isMe ? 0 : 16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null) ...[
            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(imageUrl, width: double.infinity, height: 120, fit: BoxFit.cover)),
            const SizedBox(height: 12),
          ],
          Text(text, style: theme.textStyles.bodyLarge!.copyWith(color: theme.colors.typography500, height: 1.5)),
        ],
      ),
    ),
  );
}

Widget buildTypingIndicator(BuildContext context) {
  final theme = AppThemeHelper(context);
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colors.grey0,
        border: Border.all(color: theme.colors.grey200),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(color: theme.colors.grey400, shape: BoxShape.circle)),
          const SizedBox(width: 4),
          Container(width: 6, height: 6, decoration: BoxDecoration(color: theme.colors.grey400, shape: BoxShape.circle)),
          const SizedBox(width: 4),
          Container(width: 6, height: 6, decoration: BoxDecoration(color: theme.colors.grey400, shape: BoxShape.circle)),
        ],
      ),
    ),
  );
}

Widget buildMessageInput(BuildContext context, TextEditingController controller) {
  final theme = AppThemeHelper(context);
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: BoxDecoration(color: theme.colors.grey0, boxShadow: [BoxShadow(color: theme.colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4))]),
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(border: Border.all(color: theme.colors.grey200), borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Icon(Icons.add, color: theme.colors.typography300),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "Type here...", hintStyle: theme.textStyles.bodyLarge!.copyWith(color: theme.colors.typography300), border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: theme.colors.green, borderRadius: BorderRadius.circular(12)),
          child: Icon(Icons.send, color: theme.colors.white, size: 20),
        ),
      ],
    ),
  );
}
