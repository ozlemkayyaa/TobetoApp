import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/profile_create/widgets/create_profile_tabbar_view_widget.dart';
import 'package:tobeto/screens/profile_create/widgets/create_profile_tabbar_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

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
        return DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(TImages.appBarLogo, height: 18),
              ]),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: TSizes.defaultSpace),
                  child: Icon(Iconsax.profile_circle),
                )
              ],
            ),
            body: const Column(
              children: [
                ProfileTabBarWidget(),
                //SizedBox(height: TSizes.sm),
                ProfileTabBarViewWidget(),
              ],
            ),
          ),
        );
      }
      return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
    });
  }
}
