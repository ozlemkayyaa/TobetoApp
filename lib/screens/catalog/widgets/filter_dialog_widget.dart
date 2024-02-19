import 'package:flutter/material.dart';
import 'package:tobeto/screens/catalog/data/dropdown_data.dart';
import 'package:tobeto/screens/catalog/widgets/custom_drop_button.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class FilterDialogWidget extends StatelessWidget {
  const FilterDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.special,
          itemList: DropdownData.getPrivate(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.category,
          itemList: DropdownData.getCategories(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.lessons,
          itemList: DropdownData.getEducations(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.level,
          itemList: DropdownData.getLevels(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.subject,
          itemList: DropdownData.getTopics(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.software,
          itemList: DropdownData.getSofwareLanguages(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.instructor,
          itemList: DropdownData.getInstructors(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: TTexts.situation,
          itemList: DropdownData.getSituation(),
        ),
        const SizedBox(height: TSizes.lg),
        Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(TTexts.filter)),
          ),
        ),
      ],
    );
  }
}
