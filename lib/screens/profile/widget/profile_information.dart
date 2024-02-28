import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/screens/profile/widget/profile_item_widget.dart';
import 'package:tobeto/screens/profile_create/create_profile_screen.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileInformation extends StatelessWidget {
  final UserModel userModel;

  const ProfileInformation({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileInitial || state is ProfileUpdated) {
        context.read<ProfileBloc>().add(FetchProfileEvent());
      }
      if (state is ProfileLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProfileLoaded) {
        final UserModel userModel = state.userModel;

        final String email = userModel.email!;
        final String phone = userModel.phone!;
        final String education = userModel.education!;
        final String birthdate = userModel.dateOfBirth != null
            ? DateFormat('dd/MM/yyyy').format(userModel.dateOfBirth!)
            : '';

        return Padding(
          padding: const EdgeInsets.only(
              bottom: TSizes.sm, left: TSizes.sm, right: TSizes.sm),
          child: Card(
            elevation: 3,
            color: dark ? TColors.darkerGrey : TColors.lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(TTexts.profileInformation,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateProfileScreen()),
                          );
                        },
                        icon: const Icon(Iconsax.edit),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Divider(
                      color: TColors.black,
                      height: 0.5,
                    ),
                  ),

                  // Doğum Tarihi
                  ProfileItemWidget(
                    title: TTexts.birthdate,
                    data: birthdate,
                    selectIcon: const Icon(Iconsax.calendar, size: 35),
                  ),

                  // Eğitim
                  ProfileItemWidget(
                    title: TTexts.education,
                    data: education,
                    selectIcon: const Icon(Icons.school_outlined, size: 35),
                  ),

                  // E-Mail
                  ProfileItemWidget(
                    title: TTexts.postaAdress,
                    data: email,
                    selectIcon: const Icon(CupertinoIcons.mail, size: 35),
                  ),

                  // Telefon
                  ProfileItemWidget(
                    title: TTexts.phoneNumber,
                    data: phone,
                    selectIcon: const Icon(Iconsax.call, size: 35),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
    });
  }
}
