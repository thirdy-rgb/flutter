import 'package:flutter/material.dart';
//import 'package:responsive_auth/page/settings_page.dart';
import 'package:responsive_auth/page/update_page.dart';
import 'package:responsive_auth/page/workflow_page.dart';

import '../main1.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),

      

       bottomNavigationBar: 
       BottomAppBar(
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
          ],
        ),
      ),
    );
    
  }
}
class FullScreenSearchModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // implement the search field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        suffixIcon: const Icon(Icons.close),
                        hintText: 'Search KindaCode.com',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // This button is used to close the search modal
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'))
                ],
              ),

              // display other things like search history, suggestions, search results, etc.
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text('Recently Searched',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const ListTile(
                title: Text('Flutter tutorials'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),
              const ListTile(
                title: Text('How to fry a chicken'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),
              const ListTile(
                title: Text('KindaCode.com'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),
              const ListTile(
                title: Text('Goodbye World'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),
              const ListTile(
                title: Text('Cute Puppies'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }

  // animations for the search modal
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
