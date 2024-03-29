import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/model/user_model.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class EducationLife extends StatefulWidget {
  const EducationLife({
    super.key,
  });

  @override
  State<EducationLife> createState() => _EducationLifeState();
}

class _EducationLifeState extends State<EducationLife> {
  final _formKey = GlobalKey<FormState>();
  final _userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    final TextEditingController gradeController = TextEditingController();
    final TextEditingController universityController = TextEditingController();
    final TextEditingController facultyController = TextEditingController();
    final TextEditingController startYearController = TextEditingController();
    final TextEditingController graduationYearController =
        TextEditingController();

    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileInitial || state is ProfileUpdated) {
        context.read<ProfileBloc>().add(FetchProfileEvent());
      }
      if (state is ProfileLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProfileLoaded) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) {
                    _userModel.education = value;
                  },
                  controller: gradeController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.education,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: universityController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.university,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: facultyController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.faculty,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: startYearController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstYear,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Column(
                  children: [
                    TextFormField(
                      controller: graduationYearController,
                      decoration: const InputDecoration(
                        labelText: TTexts.graduationYear,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read<ProfileBloc>()
                              .add(UpdateProfileEvent(userModel: _userModel));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(TTexts.save)),
                )
              ],
            ),
          ),
        );
      }
      return const Center(child: Text(TTexts.errorMessage));
    });
  }
}
