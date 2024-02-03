import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto/blocs/auth/auth_event.dart';
import 'package:tobeto/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Initial()) {
    on<Login>((event, emit) {});

    on<Register>((event, emit) {});
  }
}
