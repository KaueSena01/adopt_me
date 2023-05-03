import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/theme/app_sizes.dart';
import 'package:adopt_me/layers/domain/entities/user/user_entity.dart';
import 'package:adopt_me/layers/presentation/cubit/user/user_cubit.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/app_options.dart';
import 'package:adopt_me/layers/presentation/pages/user/widgets/user_card.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_app_bar.dart';
import 'package:adopt_me/layers/presentation/widgets/custom_connection_state_done_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  final blocProvider = BlocProvider.of<UserCubit>;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: blocProvider(context).getCurrentUser(),
      builder: (context, snapshot) {
        return CustomConnectionStateDoneWidget(
          snapshot: snapshot,
          builder: (context, snapshot) {
            UserEntity user = blocProvider(context).userEntity!;
            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      padding: EdgeInsets.fromLTRB(
                        AppSizes.size05,
                        AppSizes.size60,
                        AppSizes.size05,
                        AppSizes.size30,
                      ),
                      title: 'Configurações',
                      onPressed: () {},
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.size15),
                      child: Column(
                        children: [
                          UserCard(user: user),
                          const AppOptions(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
