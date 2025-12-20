// ignore_for_file: file_names
import 'package:app_delivey_food/features/search/presentation/manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import 'package:app_delivey_food/features/search/presentation/views/latest_serach_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/explore_search_mode.dart';
import '../../../../../../core/utils/home_search_mode.dart';
import '../../../../../search/presentation/views/search_view.dart';
import '../home_view_body_section.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSearchModeCubit, HomeSearchMode>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: buildHomeViewBody(searhState: state),
        );
      },
    );
  }

  Widget buildHomeViewBody({required HomeSearchMode searhState}) {
    if (searhState == HomeSearchMode.searching) {
      return const SearchView();
    } else if (searhState == HomeSearchMode.latestSearched) {
      return LatestSerachView(
        homeSearchMode: HomeSearchMode.latestSearched,
        exploreSearchMode: ExploreSearchMode.normal,
      );
    }
    return const HomeViewBodySection();
  }
}
