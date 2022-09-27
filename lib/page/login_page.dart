import 'package:flutter/material.dart';
//import 'package:responsive_auth/page/settings_page.dart';
import 'package:responsive_auth/page/update_page.dart';
import 'package:responsive_auth/page/workflow_page.dart';

import '../main1.dart';
// import '../Screens/Welcome/welcome_screen.dart';
// import '../constants.dart';

class LoginPage extends StatelessWidget { //statelessWidget
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
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

/*

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Email address",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
String dropdownValue = 'ADMIN';

Widget build(BuildContext context) {
  const color2 = Color.fromARGB(255, 8, 92, 187);
  return DropdownButton<String>(
    value: dropdownValue,
    icon: const Icon(Icons.arrow_downward),
    iconSize: 20,
    elevation: 12,
    style: const TextStyle(
      color: Color.fromARGB(255, 20, 106, 219)
    ),
    underline: Container(
      height: 2,
      color: color2,
    ),
    onChanged: (String? newValue) {
      setState(() {
        dropdownValue = newValue!;
      });
    },
    items: <String>['ADMIN', 'CLIENT']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}

void setState(Null Function() param0) {
}
*/