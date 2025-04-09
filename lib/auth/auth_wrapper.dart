import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_portal/auth/login_screen.dart';
import 'package:hospital_portal/bloc/auth/auth_bloc.dart';
import 'package:hospital_portal/screens/home_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {


    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const HomePage();
          } else if (state is AuthUnauthenticated) {
            return const LoginScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}