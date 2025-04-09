import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_portal/bloc/auth/auth_bloc.dart';
import 'package:hospital_portal/routing/router.dart';
import 'package:hospital_portal/utils/service/storage_service.dart';

import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  runApp(ToastificationWrapper(
      child: MultiProvider(providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
      ], child: const HospitalPortal())));
}

class HospitalPortal extends StatelessWidget {
  const HospitalPortal({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AppStarted());
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router(),
    );
  }
}