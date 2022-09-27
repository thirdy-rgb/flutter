import 'package:flutter/material.dart';
//import 'package:responsive_auth/page/settings_page.dart';
import 'package:responsive_auth/page/update_page.dart';
//import 'package:responsive_auth/page/workflow_page.dart';

import '../main1.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(name),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(80),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 200,
                      decoration: const BoxDecoration(
                          // shape: BoxShape.circle,
                          image: DecorationImage(
                        image: AssetImage('assets/images/logo.jpg'),
                        fit: BoxFit.fill,
                      )),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'CSU in its quest to be the lead innovative and entreprenuerial university in the region and Mindanao,established the innovation and Technoprenuership Huv(iTech), the Technology Business Incubator (TBI) jointly founded with the Department of Science and Technology- Philippine Council for industry energy and EmergingTechnologies Research and Development (DOST-PCIEERD).',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
              /*   IconButton(
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
            */
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
              /*   IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
              },
            ), */
            ],
          ),
        ),
      );
}
