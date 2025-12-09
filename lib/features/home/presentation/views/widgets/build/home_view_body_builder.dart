// ignore_for_file: file_names
import 'package:app_delivey_food/features/search/presentation/views/latest_serach_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../search/presentation/manager/search_mode_cubit/search_mode_cubit.dart';
import '../../../../../search/presentation/views/search_view.dart';
import '../home_view_body_section.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchModeCubit, SearchModeState>(
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

  Widget buildHomeViewBody({required SearchModeState searhState}) {
    if (searhState is SearchModeChanged && searhState.isSearchMode) {
      return const SearchView();
    } else if (searhState is LatestSearchedModeChanged &&
        searhState.isLatestSearchedMode) {
      return LatestSerachView();
    }
    return const HomeViewBodySection();
  }
}
