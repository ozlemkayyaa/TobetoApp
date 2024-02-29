import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/screens/catalog/data/dropdown_data.dart';
import 'package:tobeto/screens/catalog/models/dropdown_items.dart';
import 'package:tobeto/screens/catalog/widgets/custom_drop_button.dart';
import 'package:tobeto/screens/profile_create/model/social_media_model.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  List<SocialMediaData> selectedSocialMedia = [];

  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial || state is ProfileUpdated) {
          context.read<ProfileBloc>().add(FetchProfileEvent());
        }

        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProfileLoaded) {
          selectedSocialMedia = state.selectedSocialMedia;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdownButton(
                  buttonText: TTexts.socialMedia,
                  itemList: DropdownData.getSocialMedia(),
                  onChanged: (DropdownItem? selectedItem) {
                    setState(() {
                      if (selectedItem != null) {
                        selectedSocialMedia.add(SocialMediaData(
                          name: selectedItem.text,
                          url: '', // URL belli değil
                        ));
                      }
                    });
                  },
                ),
                const SizedBox(height: TSizes.defaultSpace),
                TextFormField(
                  controller: urlController,
                  decoration: const InputDecoration(
                    labelText: TTexts.url,
                  ),
                ),

                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Seçilen sosyal medya hesabının URL'sini kaydeder
                        selectedSocialMedia.last.url = urlController.text;
                        urlController.clear(); // Text alanını temizler
                        context.read<ProfileBloc>().add(
                            UpdateSocialMediaListEvent(selectedSocialMedia));
                        Navigator.pop(context);
                      });
                    },
                    child: const Text(TTexts.save),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),

                // Seçilen sosyal medya hesaplarını ekrana yazdırır
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedSocialMedia
                      .map((socialMedia) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                socialMedia.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: TSizes.sm),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(TSizes.sm),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.circular(TSizes.sm),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(socialMedia.url,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),

                                    // Çöp Kutusuna basılınca bilgiler siliniyor
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          selectedSocialMedia
                                              .remove(socialMedia);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ))
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
