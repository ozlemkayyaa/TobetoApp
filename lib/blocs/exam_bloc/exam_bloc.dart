import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto/blocs/exam_bloc/exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc(super.initialState);
}
