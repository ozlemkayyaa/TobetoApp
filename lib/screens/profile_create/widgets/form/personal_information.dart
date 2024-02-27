import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class PersonalInformationForm extends StatefulWidget {
  const PersonalInformationForm({
    super.key,
  });

  @override
  State<PersonalInformationForm> createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController surNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController tcController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController townController = TextEditingController();
    final TextEditingController streetController = TextEditingController();
    final TextEditingController aboutController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Ad - Soyad
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.signName,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: surNameController,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.signSurname,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Telefon - Doğum Tarihi

                  const SizedBox(height: TSizes.defaultSpace),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.signPhoneNumber,
                            prefixIcon: Icon(Iconsax.call),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.birthdate,
                            prefixIcon: Icon(Iconsax.calendar),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // TC - Mail

                  const SizedBox(height: TSizes.defaultSpace),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: tcController,
                          keyboardType: TextInputType.number,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.tc,
                            prefixIcon: Icon(Iconsax.personalcard),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.signEmail,
                            prefixIcon: Icon(CupertinoIcons.mail),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // Ülke

                  TextFormField(
                    controller: countryController,
                    decoration: const InputDecoration(
                      labelText: TTexts.country,
                    ),
                  ),

                  // İl - İlçe

                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cityController,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.city,
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: townController,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.ilce,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Mahalle/Sokak

                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: streetController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: TTexts.street,
                    ),
                  ),

                  // Hakkımda

                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: aboutController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: TTexts.me,
                    ),
                  ),

                  // Kaydet Butonu

                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(TTexts.save)),
                  )
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
