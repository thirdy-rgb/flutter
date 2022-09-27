

import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_auth/main.dart';
//import '../main.dart';
import '../main1.dart';
//import '../page/update_page.dart';

final CollectionReference data = FirebaseFirestore.instance.collection('data');
//FirebaseFirestore firestore = FirebaseFirestore.instance;
// FirebaseApp data = Firebase.app('data');
// FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: data);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

@override
class _InsertDataState extends State<InsertData> {
  final TextEditingController controlAgency = TextEditingController();
  final TextEditingController controlProgramName = TextEditingController();
  final TextEditingController controlDescription = TextEditingController();
  final TextEditingController controlDate = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  DateTimeRange? _selectedDateRange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Insert Data'), actions: [
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
                value: 0,
                child: Text('Home'),
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
                    SizedBox(width: 8),
                    Text('Sign Out(Admin)'),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Inserting data in Cloud Firebase Database',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TextFormField(
                  controller: controlAgency,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Agency Name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter agency name';
                    }
                    return null;
                  },
                ),
              ),
              // const SizedBox(
              //   height: 1,
              // ),
              Expanded(
                child: TextFormField(
                  controller: controlProgramName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Program name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description name';
                    }
                    return null;
                  },
                ),
              ),

              Expanded(
                child: TextFormField(
                  controller: controlDescription,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Description'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill this blank';
                    }
                    return null;
                  },
                ),
              ),
/*
              Expanded(child: MaterialButton(onPressed: _showDatePicker,
              ) 
              
              */
              Text(
                "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}",
                style: const TextStyle(fontSize: 20, color: Colors.blue),             
              ),
              const SizedBox(
                height: 15,
              ),             
              Text(
                  "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}",
                  style: const TextStyle(fontSize: 20, color: Colors.grey)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    //String? startdate = _selectedDateRange?.start.toString().split(' ')[0];
                    //String? enddate = _selectedDateRange?.end.toString().split(' ')[0];

                    if (key.currentState!.validate()) {
                      data.add({
                        'agencyName': controlAgency,
                        'projectName': controlProgramName,
                        'description': controlDescription,
                        'start-date': _selectedDateRange?.start,
                        'end-date': _selectedDateRange?.end,
                      });
                      // CollectionReference reference =
                      //     FirebaseFirestore.instance.collection('data');
                      try {
                        //await reference.add('data');
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Data added successfully')));
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Some error occurred $error')));
                            
                      }
                    }
                  },
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _show,
        child: const Icon(Icons.date_range),
      ),
    );
  }

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      (result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }
}
