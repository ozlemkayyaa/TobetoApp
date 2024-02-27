import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileTabBarWidget extends StatelessWidget {
  const ProfileTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileInitial || state is ProfileUpdated) {
        context.read<ProfileBloc>().add(FetchProfileEvent());
      }
      if (state is ProfileLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProfileLoaded) {
        return TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: TColors.primary,
            unselectedLabelColor: TColors.darkGrey,
            labelColor: THelperFunctions.isDarkMode(context)
                ? TColors.white
                : TColors.primary,
            tabs: [
              Tab(
                  child: Text(TTexts.personalInfo,
                      style: Theme.of(context).textTheme.titleLarge)),
              Tab(
                  child: Text(TTexts.experience,
                      style: Theme.of(context).textTheme.titleLarge)),
              Tab(
                  child: Text(TTexts.educationLife,
                      style: Theme.of(context).textTheme.titleLarge)),
              Tab(
                  child: Text(TTexts.skill,
                      style: Theme.of(context).textTheme.titleLarge)),
              Tab(
                  child: Text(TTexts.socialMedia,
                      style: Theme.of(context).textTheme.titleLarge)),
              Tab(
                  child: Text(TTexts.language,
                      style: Theme.of(context).textTheme.titleLarge)),
              Tab(
                  child: Text(TTexts.settings,
                      style: Theme.of(context).textTheme.titleLarge)),
            ]);
      }
      return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
    });
  }
}
