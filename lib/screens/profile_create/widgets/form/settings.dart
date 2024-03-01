import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

bool _oldObscureText = true;
bool _newObscureText = true;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController oldController = TextEditingController();
    final TextEditingController newController = TextEditingController();
    final TextEditingController newAgainController = TextEditingController();

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileInitial || state is ProfileUpdated) {
        context.read<ProfileBloc>().add(FetchProfileEvent());
      }
      if (state is ProfileLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProfileLoaded) {
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              children: [
                // Password
                TextFormField(
                  controller: oldController,
                  obscureText: _oldObscureText,
                  decoration: InputDecoration(
                    labelText: TTexts.old,
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_oldObscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _oldObscureText = !_oldObscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: newController,
                  obscureText: _newObscureText,
                  decoration: InputDecoration(
                    labelText: TTexts.newPassword,
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_newObscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _newObscureText = !_newObscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Password Again
                TextFormField(
                  controller: newAgainController,
                  obscureText: _newObscureText,
                  decoration: InputDecoration(
                    labelText: TTexts.newAgain,
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_newObscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _newObscureText = !_newObscureText;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(ChangePassword(
                            newPassword: newController.text.trim(),
                            confirmNewPassword:
                                newAgainController.text.trim()));
                      },
                      child: const Text(TTexts.changePassword)),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.error,
                        side: const BorderSide(color: TColors.error)),
                    onPressed: () {
                      context.read<ProfileBloc>().add(DeleteUserEvent());
                      BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                      Navigator.pop(context);
                    },
                    child: const Text(TTexts.end),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
    });
  }
}
