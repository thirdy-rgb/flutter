
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_auth/main.dart';
import 'package:responsive_auth/main1.dart';
//import 'package:responsive_auth/page/settings_page.dart';
import 'package:responsive_auth/page/update_page.dart';
//import 'package:responsive_auth/page/workflow_page.dart';
import '../page/share_page.dart';
import '../screens/insert_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PeoplePage());
}
  
class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}
class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigatu Start-Up Grants'), actions: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.white),
            textTheme: const TextTheme().apply(bodyColor: Colors.white),
          ),
          child: PopupMenuButton<int>(
            color: Colors.blueGrey,
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Main Page'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Share'),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 5),
                    Text('Sign Out'),
                  ],
                ),
              ),
            ],
          ),
        )
      ]
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              width: 250,
              height: 250,
              'assets/images/asd.png',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Navigatu Grants Database 2022',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
               color: Colors.blue,
                textColor: Colors.white,
               minWidth: 300,
               height: 40,
              child: const Text('Add Data'),
              onPressed: () {
                Navigator.push(context,
                     MaterialPageRoute(builder: (context) => const InsertData()));
             },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
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
            // IconButton(
            //   icon: const Icon(
            //     Icons.people,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //      Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const WorkFlow()));
            //   },
            // ),
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

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MainPage()),
          
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SharePage()),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MyApp()),
          (route) => false,
        );
    }
  }
}
