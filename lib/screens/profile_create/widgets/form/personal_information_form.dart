import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/model/user_model.dart';
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
  final _userModel = UserModel();
  DateTime? _selectedDate; // Kullanıcının seçtiği doğum tarihi
  final TextEditingController dateController = TextEditingController();
  // Doğum tarihi seçildiğinde çağrılacak fonksiyon
  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Başlangıçta gösterilecek tarih
      firstDate: DateTime(1900), // Seçilebilecek en eski tarih
      lastDate: DateTime.now(), // Seçilebilecek en yeni tarih
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        dateController.text =
            DateFormat(TTexts.dateFormat).format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController surNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
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
                          onSaved: (value) {
                            _userModel.name = value;
                          },
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
                          onSaved: (value) {
                            _userModel.surname = value;
                          },
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
                          onSaved: (value) {
                            _userModel.phone = value;
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.phoneNumber,
                            prefixIcon: Icon(Iconsax.call),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: InkWell(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            absorbing: true,
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
                          onSaved: (value) {
                            _userModel.tcNo = value;
                          },
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
                          onSaved: (value) {
                            _userModel.email = value;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.eMail,
                            prefixIcon: Icon(CupertinoIcons.mail),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // Ülke

                  TextFormField(
                    onSaved: (value) {
                      _userModel.country = value;
                    },
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
                          onSaved: (value) {
                            _userModel.city = value;
                          },
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
                    onSaved: (value) {
                      _userModel.description = value;
                    },
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (_selectedDate != null) {
                            _userModel.dateOfBirth = _selectedDate;
                          }
                          context
                              .read<ProfileBloc>()
                              .add(UpdateProfileEvent(userModel: _userModel));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(TTexts.save),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      return const Center(child: Text(TTexts.errorMessage));
    });
  }
}
