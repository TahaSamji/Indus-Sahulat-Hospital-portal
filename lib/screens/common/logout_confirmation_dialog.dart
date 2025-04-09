import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_portal/bloc/auth/auth_bloc.dart';
import 'package:hospital_portal/routing/routes.dart';


class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text('Confirm Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () async {
            await Future.delayed(Duration(milliseconds: 500));
            context.read<AuthBloc>().add(LoggedOut());
            context.go(Routes.authLogin.path);
          },
        ),
      ],
    );
  }
}