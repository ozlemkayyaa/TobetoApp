import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/education_bloc/education_event.dart';
import 'package:tobeto/api/blocs/education_bloc/education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc(super.initialState);
}
