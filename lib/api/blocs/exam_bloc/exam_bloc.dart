import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto/api/blocs/exam_bloc/exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc(super.initialState);
}
