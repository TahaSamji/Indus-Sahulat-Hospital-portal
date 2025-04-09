import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_portal/bloc/auth/auth_bloc.dart';
import 'package:hospital_portal/provider/password_visibility_provider.dart';
import 'package:hospital_portal/routing/routes.dart';
import 'package:hospital_portal/utils/service/auth_service.dart';
import 'package:hospital_portal/utils/service/notification_service.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PasswordVisibilityProvider(),
      child: _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final AuthService authService = AuthService();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      color: Color(0xffff2222),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Mobile Number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xffF3F3F3),
                      hintText: "2435353636666",
                      hintStyle: TextStyle(
                        color: Color(0xccff2222),
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(color: Color(0xffff2222)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Consumer<PasswordVisibilityProvider>(
                    builder: (context, provider, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: !provider.isVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF3F3F3),
                          hintText: "**************",
                          hintStyle: const TextStyle(
                            color: Color(0xccff2222),
                            fontSize: 14,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              provider.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xffff2222),
                            ),
                            onPressed: () {
                              Provider.of<PasswordVisibilityProvider>(
                                context,
                                listen: false,
                              ).toggleVisibility();
                            },
                          ),
                        ),
                        style: const TextStyle(color: Color(0xffff2222)),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle forget password
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Color(0xffff2222),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xffff2222),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onPressed: () async {
                        String? token;
                        if (passwordController.text.isEmpty ||
                            phoneController.text.isEmpty) {
                          token = await authService.login(
                              phoneNumber: "923001234567",
                              password: "Abcd@1234");
                        } else {
                          token = await authService.login(
                              phoneNumber: phoneController.text.trim(),
                              password: passwordController.text.trim());
                        }

                        if (token == "Login failed") {
                          showErrorToast(context, "Could not Log in");
                        } else {
                          showSuccessToast(context, 'Logged In Successfully');
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          context.read<AuthBloc>().add(LoggedIn(token!));
                          context.go(Routes.home.path);
                        }
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text("Don't have an account?"),
                  //     TextButton(
                  //       onPressed: () {
                  //         context.go(Routes.authSignup.path);
                  //       },
                  //       child: const Text(
                  //         "Sign Up",
                  //         style: TextStyle(color: Color(0xffff2222)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}