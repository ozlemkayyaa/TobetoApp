import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/screens/profile/widget/profile_about.dart';
import 'package:tobeto/screens/profile/widget/profile_avatar.dart';
import 'package:tobeto/screens/profile/widget/profile_information.dart';
import 'package:tobeto/screens/profile/widget/profile_skills.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(TImages.appBarLogo, height: 18),
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Icon(Iconsax.profile_circle),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileInitial || state is ProfileUpdated) {
            context.read<ProfileBloc>().add(FetchProfileEvent());
          }
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileLoaded) {
            UserModel user = state.user;
            return const SingleChildScrollView(
              child: Column(
                children: [
                  ProfileAvatar(),
                  ProfileInformation(),
                  ProfileAbout(),
                  ProfileSkills(),
                ],
              ),
            );
          }
          if (state is ProfileError) {
            return Center(child: Text(state.errorMessage));
          }
          return Center(child: Container());
        },
      ),
    );
  }
}
