import 'package:app_delivey_food/core/cubit/cubit/bottom_naviagtion_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entities/bottom_navigtion_bar_entity.dart';
import '../helper/app_theme_helper.dart';
import 'bottom_naviagtion_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<BottomNavigtionBarCubit, int>(
      builder: (context, state) {
        return Container(
          height: 80,
          padding: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: theme.colors.grey0,
            boxShadow: [
              BoxShadow(
                color: theme.colors.grey0,
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, -2),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.fromBorderSide(
              BorderSide(color: theme.colors.grey200),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getBottomNavigtionBarEntity.asMap().entries.map((entry) {
              final index = entry.key;
              final value = entry.value;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<BottomNavigtionBarCubit>()
                        .changeIndex(index);
                  },
                  child: BottomNavigationBarItems(
                    bottomNavigtionBarEntity: value,
                    isSelected: state == index,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
