import 'package:app_delivey_food/core/utils/explore_search_mode.dart';
import 'package:app_delivey_food/core/utils/home_search_mode.dart';
import 'package:app_delivey_food/features/search/presentation/views/widgets/latest_search_view_body.dart';
import 'package:flutter/material.dart';

class LatestSerachView extends StatelessWidget {
  const LatestSerachView({
    super.key,
    required this.homeSearchMode,
    required this.exploreSearchMode,
  });
  final HomeSearchMode homeSearchMode;
  final ExploreSearchMode exploreSearchMode;
  @override
  Widget build(BuildContext context) {
    return LatestSearchViewBody(
      homeSearchMode: homeSearchMode,
      exploreSearchMode: exploreSearchMode,
    );
  }
}
