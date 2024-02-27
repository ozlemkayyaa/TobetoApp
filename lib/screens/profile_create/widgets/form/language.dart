import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/screens/catalog/data/dropdown_data.dart';
import 'package:tobeto/screens/catalog/models/dropdown_items.dart';
import 'package:tobeto/screens/catalog/widgets/custom_drop_button.dart';
import 'package:tobeto/screens/profile_create/model/language_model.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<LanguageData> selectedLanguage = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial || state is ProfileUpdated) {
          context.read<ProfileBloc>().add(FetchProfileEvent());
        }
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdownButton(
                  buttonText: TTexts.language,
                  itemList: DropdownData.getLanguage(),
                  onChanged: (DropdownItem? selectedItem) {
                    setState(() {
                      if (selectedItem != null) {
                        selectedLanguage.add(
                            LanguageData(name: selectedItem.text, level: ""));
                      }
                    });
                  },
                ),
                const SizedBox(height: TSizes.defaultSpace),
                CustomDropdownButton(
                  buttonText: TTexts.languageLevel,
                  itemList: DropdownData.getLanguageLevel(),
                  onChanged: (DropdownItem? selectedItem) {
                    setState(() {
                      if (selectedItem != null) {
                        selectedLanguage.add(
                            LanguageData(name: "", level: selectedItem.text));
                      }
                    });
                  },
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(TTexts.save),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedLanguage
                      .map(
                        (language) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (language.name.isNotEmpty)
                              Text(
                                language.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            const SizedBox(height: TSizes.sm),
                            if (language.level.isNotEmpty)
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(TSizes.sm),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.circular(TSizes.sm)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(language.level,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),

                                    // Çöp Kutusuna basılınca bilgiler siliniyor
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          selectedLanguage.remove(language);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            const SizedBox(height: TSizes.sm),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('Beklenmeyen bir hata oluştu.'));
      },
    );
  }
}
