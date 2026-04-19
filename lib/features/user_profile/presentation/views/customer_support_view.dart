import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/function/customer_support_functions.dart';

import '../../../../core/utils/assets.dart';

class CustomerSupportView extends StatefulWidget {
  const CustomerSupportView({super.key});

  static const String routeName = '/customer_support';

  @override
  State<CustomerSupportView> createState() => _CustomerSupportViewState();
}

class _CustomerSupportViewState extends State<CustomerSupportView> {
  final TextEditingController _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return Scaffold(
      backgroundColor: theme.colors.grey0,
      appBar: AppBar(
        backgroundColor: theme.colors.grey0,
        elevation: 0,
        leadingWidth: 80,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: theme.colors.typography500, size: 18),
          label: Text(
            "Back",
            style: theme.textStyles.titleMedium!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
          ),
        ),
        title: Text(
          "Customer Support",
          style: theme.textStyles.headlineMedium!.copyWith(
            color: theme.colors.typography500,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                children: [
                  buildMessageBubble(
                    context: context,
                    text: "Good morning! We're from Bobo Foods, how may I help you?",
                    isMe: false,
                  ),
                  buildMessageBubble(
                    context: context,
                    text:
                        "I have ordered for a pepperoni cheese pizza but I have received a different. There must have been a mistake somewhere. Please replace it.",
                    isMe: true,
                  ),
                  buildMessageBubble(
                    context: context,
                    text:
                        "We are very sorry to hear that. We will immediately resend the delivery guy for replacement. But first, please send a picture of the pizza for confirmation.",
                    isMe: false,
                  ),
                  buildMessageBubble(
                    context: context,
                    text: "Here's a picture for confirmation. Now's please replace it. Thank you.",
                    isMe: true,
                    imageUrl: Assets.assetsImagesFastFood,
                  ),
                  const SizedBox(height: 16),
                  buildTypingIndicator(context),
                ],
              ),
            ),
            buildMessageInput(context, _chatController),
          ],
        ),
      ),
    );
  }



}
