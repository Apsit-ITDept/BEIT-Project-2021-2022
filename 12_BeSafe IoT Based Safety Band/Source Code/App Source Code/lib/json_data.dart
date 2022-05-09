import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

const String kFileName = 'myJsonFile.json';
Color purpleColor = Colors.purple.shade700;
const InputDecoration kInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  labelText: 'Label Text',
);
const TextStyle kInputTextStyle = TextStyle(
  fontSize: 22,
  color: Colors.blue,
);

class JsonData extends StatefulWidget {
  @override
  _JsonDataState createState() => _JsonDataState();
}

class _JsonDataState extends State<JsonData> {
  bool _fileExists = false;
  late File _filePath;
  CollectionReference location =
      FirebaseFirestore.instance.collection('location');
  late String _jsonString;

  Future<String> get _localPath async {
    String directory = '/storage/emulated/0/Documents/';
    if (Platform.isIOS) {
      Directory path = await getApplicationDocumentsDirectory();
      directory = path.path;
    }
    return directory;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }

  Future<void> _writeJson() async {
    _filePath = await _localFile;
    QuerySnapshot querySnapshot = await location.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    _jsonString = jsonEncode(allData);
    print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    //4. Write _jsonString to the _filePath
    _filePath.writeAsString(_jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create JSON File',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Trueno',
            ),
          ),
          backgroundColor: purpleColor,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Text(
                  'Add Location to JSON file',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Trueno',
                    color: purpleColor,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    _writeJson();
                    final file = await _localFile;
                    _fileExists = await file.exists();
                    //_fileName = file;

                    // setState(() {});
                    // _controllerKey.clear();
                    // _controllerValue.clear();
                  },
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      shadowColor: Colors.purpleAccent,
                      color: purpleColor,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'Add Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Trueno'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      _fileExists
                          ? _filePath.toString()
                          : 'File doesn\'t exist.',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: purpleColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
