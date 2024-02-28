import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/screens/profile_create/widgets/form/language.dart';
import 'package:tobeto/screens/profile_create/widgets/form/settings.dart';
import 'package:tobeto/screens/profile_create/widgets/form/personal_information_form.dart';
import 'package:tobeto/screens/profile_create/widgets/form/education_life.dart';
import 'package:tobeto/screens/profile_create/widgets/form/experience.dart';
import 'package:tobeto/screens/profile_create/widgets/form/skills.dart';
import 'package:tobeto/screens/profile_create/widgets/form/social_media.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ProfileTabBarViewWidget extends StatelessWidget {
  const ProfileTabBarViewWidget({
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
        return const Expanded(
          child: Padding(
            padding: EdgeInsets.all(TSizes.sm),
            child: TabBarView(
              children: [
                PersonalInformationForm(),
                Experience(),
                EducationLife(),
                Skills(),
                SocialMedia(),
                Language(),
                Settings(),
              ],
            ),
          ),
        );
      }
      return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
    });
  }
}
