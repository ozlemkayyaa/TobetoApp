import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto/blocs/catalog_bloc/catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(super.initialState);
}
