import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_portal/utils/service/storage_service.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String token;

  LoggedIn(this.token);
}

class LoggedOut extends AuthEvent {}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String token;

  AuthAuthenticated(this.token);
}

class AuthUnauthenticated extends AuthState {}


class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final StorageService _storageService = StorageService();

  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final token = await _storageService.getToken();
    print("on app start :");
    print(token);
    if (token != null) {
      emit(AuthAuthenticated(token));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    await _storageService.saveToken(event.token);
    emit(AuthAuthenticated(event.token));
  }

  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await _storageService.deleteToken();
    emit(AuthUnauthenticated());
  }
}