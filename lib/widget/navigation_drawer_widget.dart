import 'package:flutter/material.dart';
import '../page/access_materials.dart';
//import '../page/update_page.dart';
import '../page/view_grants.dart';
//import '../page/workflow_page.dart';
//import '../page/favourites_page.dart';
//import '../page/people_page.dart';
import '../page/user_page.dart';
//import '../page/assistant_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  //String? get id => null;
  @override
  Widget build(BuildContext context) {
    const name = 'NAVIGATU';
    const email = 'Navigatu@gmail.com';
    const urlImage =
        'https://scontent.fmnl14-1.fna.fbcdn.net/v/t39.30808-6/284252428_990587674991614_3851786786362046169_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFZAPBbOJBTGpzRpy-8DaAzmeIJcg4Ct46Z4glyDgK3jj8Ei7AecWCdIywzcex2evCEPNG6s7LZp612IPRGYGsZ&_nc_ohc=En7gGukNWcgAX9gLwyk&tn=Wa6Lwc_S_X2DGw0O&_nc_ht=scontent.fmnl14-1.fna&oh=00_AT_Y99YQs6h3CK19bOpt3ZbWr3rlUo-xERy5ezu8LaAl3g&oe=63272390';
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 58, 138, 241),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserPage(
                  name: 'About us',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'View Grants',
                    icon: Icons.account_tree_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Access Materials',
                    icon: Icons.school_outlined,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
     
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewGrantsPage(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AccessMaterialsPage(),
        ));
        break;
    }
  }
}
