//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import '../widget/main.dart';
import '../page/favourites_page.dart';
import '../page/share_page.dart';
import '../page/update_page.dart';
import '../page/workflow_page.dart';
import '../page/people_page.dart';
//import '../widget/tabbar_widget.dart';
import '../widget/navigation_drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        endDrawer: const NavigationDrawerWidget(),
        appBar: AppBar(title: const Text('Hello There, Admin!'), actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.indigo,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
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
                      SizedBox(width: 8),
                      Text('Sign Out(Admin)'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
        //  backgroundColor: Colors.cyan,
        body: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/portrait.png'),
                fit: BoxFit.cover),
          ),
          child: Expanded(
            child: GridView.count(crossAxisCount: 2, children: <Widget>[
              //  Expanded(
              //  child:
              InkWell(
                //     margin: const EdgeInsets.all(0.0),
                child: // partner aning tulo.....!@!!!!!
                    InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PeoplePage()),
                    );
                  },
                  splashColor: const Color.fromARGB(255, 23, 140, 236),
                  child: Center(
                    child: ClipRRect(
                        //  borderRadius: BorderRadius.circular(10.0),
                        //  StyleText: Center,
                        child: Image.asset('assets/images/grants.jpg',
                            width: 150.0, height: 150.0)),
                  ),
                ),
              ),
              //   ),
              const Center(
                child: Text(
                  'Grants (click image)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), //partner sa babaw
              ),
              //  Expanded(
              //     child:
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouritesPage(title: 'hello',)),
                  );
                },
                splashColor: const Color.fromARGB(255, 63, 182, 241),
                child: ClipRRect(
                  //  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset('assets/images/briefing.jpg',
                      width: 100.0, height: 100.0),
                ),
              ),
              //    ),
              const Center(
                child: Text(
                  'Tutorials (click image)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), //partner sa babaw
              ),
              //  Expanded(
              //   child:
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkFlow()),
                    );
                  },
                  splashColor: const Color.fromARGB(255, 63, 182, 241),
                  child: Center(
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset('assets/images/workflow.png',
                          width: 150.0, height: 150.0),
                    ),
                  )),
              //     ),
              const Center(
                child: Text(
                  'Workflow (click image)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), //partner sa babaw
              ),
              //     Expanded(
              //      child:
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdatePage()),
                    );
                  },
                  splashColor: const Color.fromARGB(255, 66, 121, 249),
                  child: Center(
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset('assets/images/update.png',
                          width: 150.0, height: 150.0),
                    ),
                  )),
              //  ),

              const Center(
                child: Text(
                  'Update (click image)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                //partner sa babaw
              ),
            ]),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
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
              const SizedBox(
                width: 10,
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
