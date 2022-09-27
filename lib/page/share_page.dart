import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_auth/page/update_page.dart';
import 'package:share/share.dart';

import '../main1.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  SharePageState createState() => SharePageState();
}

class SharePageState extends State<SharePage> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    String pickedFile = imagePaths == null ? "" : imagePaths.toString();
    String trimmedFileName = pickedFile.split("/").last;
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Flutter Share Data'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: const CircularNotchedRectangle(),
          notchMargin: 40,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Share text:',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter some text and/or link to share',
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Share subject:',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter subject to share (optional)',
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    subject = value;
                  }),
                ),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add image"),
                  onTap: () async {
                    final imagePicker = ImagePicker();
                    // ignore: deprecated_member_use
                    final pickedFile = await imagePicker.getImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        imagePaths.add(pickedFile.path);
                      });
                    }
                  },
                ),
                // ignore: unnecessary_null_comparison
                Text(imagePaths == null ? "" : trimmedFileName),

                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*  Builder(
                        builder: (BuildContext context) {
                          return ElevatedButton(
                          //  color: Colors.orangeAccent[100],
                            onPressed: text.isEmpty && imagePaths.isEmpty
                                ? null
                                : () => _onSharePage(context),
                            child: const Text('Share'),
                          );
                        },
                      ), */
                    const Padding(padding: EdgeInsets.only(top: 12.0)),
                    Builder(
                      builder: (BuildContext context) {
                        return ElevatedButton(
                          //   color: Colors.orangeAccent[100],

                          child: const Text('Share With Empty Fields'),
                          onPressed: () => _onShareWithEmptyFields(context),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  /* _onSharePage(BuildContext context) async {

    final RenderObject? box = context.findRenderObject();

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  } */

  _onShareWithEmptyFields(BuildContext context) async {
    await Share.share("text");
  }
}
