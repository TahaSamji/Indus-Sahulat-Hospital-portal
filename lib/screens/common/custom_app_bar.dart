import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_portal/routing/routes.dart';
import 'package:hospital_portal/screens/common/logout_confirmation_dialog.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pagetitle;
  const CustomAppBar(this.pagetitle,{super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      toolbarHeight: 100,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 100,
            width: 100,
            child: InkWell(
              onTap: () {
                context.go(Routes.home.path);
              },
              child: Image.asset(
                'assets/Indus_Hospital_logo.png',
                fit: BoxFit.contain,
              ),
            )),
      ),
      leadingWidth: 100,
      centerTitle: true,
      title:  Text(
        pagetitle,
        style: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      shadowColor: Colors.black,
      elevation: 2,
      actions: [
        IconButton(
            onPressed: () {
              context.go(Routes.eventPage.path);
            },
            icon: Icon(
              size: 35,
              Icons.notifications_active,
              color: Colors.red,
            )),
        IconButton(
            onPressed: ()  {
              showDialog(
                context: context,
                builder: (context) =>
                    LogoutConfirmationDialog(),
              );
            },
            icon: Icon(
              size: 35,
              Icons.logout,
              color: Colors.red,
            )),
        SizedBox(
          width: 30,
        )
      ],
    );
  }
}