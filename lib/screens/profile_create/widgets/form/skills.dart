import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto/screens/catalog/data/dropdown_data.dart';
import 'package:tobeto/screens/catalog/models/dropdown_items.dart';
import 'package:tobeto/screens/catalog/widgets/custom_drop_button.dart';
import 'package:tobeto/screens/profile_create/model/skills_model.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List<String> selectedSkills = [];

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
          final List<SkillsData> selectedSkills = state.selectedSkills;
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomDropdownButton(
                  buttonText: TTexts.skill,
                  itemList: DropdownData.getSkills(),
                  onChanged: (DropdownItem? selectedItem) {
                    setState(() {
                      if (selectedItem != null) {
                        selectedSkills
                            .add(SkillsData(skills: selectedItem.text));
                        context
                            .read<ProfileBloc>()
                            .add(UpdateSkillsEvent(selectedSkills));
                      }
                    });
                  },
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(TTexts.save),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedSkills
                      .map(
                        (skillData) => Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(TSizes.sm),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(TSizes.sm),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                skillData.skills,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    selectedSkills.remove(skillData);
                                    context
                                        .read<ProfileBloc>()
                                        .add(UpdateSkillsEvent(selectedSkills));
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text(TTexts.errorMessage));
      },
    );
  }
}
