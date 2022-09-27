import 'package:flutter/material.dart';
//import 'package:responsive_auth/page/settings_page.dart';
import 'package:responsive_auth/page/update_page.dart';
import 'package:responsive_auth/page/workflow_page.dart';

import '../main1.dart';

class AccessMaterialsPage extends StatelessWidget {
  const AccessMaterialsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Access Materials'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 75, 136, 241),
        ),
         bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainPage()));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorkFlow()));
              },
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UpdatePage()));
              },
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.settings,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //      Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const SettingsPage()));
            //   },
            // ),
          ],
        ),
      ),
      );
}