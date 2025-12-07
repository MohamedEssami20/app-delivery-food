import 'package:flutter/material.dart';

import 'search_view_body_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: SearchViewBodyBuilder())]);
  }
}
