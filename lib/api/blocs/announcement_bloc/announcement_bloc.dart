import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/api/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto/api/blocs/announcement_bloc/announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnoucementState> {
  AnnouncementBloc(super.initialState);
}
