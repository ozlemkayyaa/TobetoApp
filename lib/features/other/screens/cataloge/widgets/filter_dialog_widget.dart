import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/cataloge/data/dropdown_data.dart';
import 'package:tobeto/features/other/screens/cataloge/widgets/custom_drop_button.dart';
import 'package:tobeto/utils/constants/sizes.dart';

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
          buttonText: "Bana Özel",
          itemList: DropdownData.getPrivate(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Kategori",
          itemList: DropdownData.getCategories(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Eğitimler",
          itemList: DropdownData.getEducations(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Seviye",
          itemList: DropdownData.getLevels(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Konu",
          itemList: DropdownData.getTopics(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Yazılım Dili",
          itemList: DropdownData.getSofwareLanguages(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Eğitmen",
          itemList: DropdownData.getInstructors(),
        ),
        const SizedBox(height: TSizes.md),
        CustomDropdownButton(
          buttonText: "Durum",
          itemList: DropdownData.getSituation(),
        ),
        const SizedBox(height: TSizes.lg),
        Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Filtrele")),
          ),
        ),
      ],
    );
  }
}
