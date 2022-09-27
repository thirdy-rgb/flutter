import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_auth/main1.dart';
import 'package:responsive_auth/page/view_grants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Hello There!'),
          centerTitle: true,
          actions: [
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
                  // const PopupMenuItem<int>(
                  //   value: 0,
                  //   child: Text('Setting'),
                  // ),
                  // const PopupMenuItem<int>(
                  //   value: 1,
                  //   child: Text('Share'),
                  // ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.logout),
                        SizedBox(width: 2),
                        Text('Log Out'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            width: 400,
            height: 300,
            'assets/images/logo.jpg',
          ),
          const SizedBox(
            height: 100, //////// padding 1 sa button
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 5, color: Colors.grey),
                  //backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              label: const Text('ADMIN'),
              icon: const Icon(Icons.school_rounded),
            ),
          ),
          const SizedBox(
            height: 20, /////////padding sa box
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewGrantsPage()));
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 5, color: Colors.grey),
                  //backgroundcolor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              label: const Text('CLIENT '),
              icon: const Icon(Icons.people),
            ),
          ),
          const SizedBox(
            height: 100, /////////////height sa box
          )
        ]),
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      // case 0:
      //   Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => const SettingsPage()),
      //   );
      //   break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
        break;
      // case 2:
      //   Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => const MyApp()),
      //     (route) => false,
      //   );
    }
  }
}
