import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto/api/blocs/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class Experience extends StatelessWidget {
  const Experience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController companyController = TextEditingController();
    final TextEditingController positionController = TextEditingController();
    final TextEditingController sectorController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController startController = TextEditingController();
    final TextEditingController finalController = TextEditingController();
    final TextEditingController explainJobController = TextEditingController();

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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: companyController,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.companyNames,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: positionController,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.position,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: sectorController,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.sector,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: cityController,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.citySelect,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: startController,
                          keyboardType: TextInputType.datetime,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.startYear,
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: finalController,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: TTexts.finalyear,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: explainJobController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: TTexts.explainJob,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
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
      return const Center(child: Text(TTexts.errorMessage));
    });
  }
}
