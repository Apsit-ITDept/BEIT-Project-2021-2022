// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_new, sized_box_for_whitespace

import 'package:authentication/flashcards/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: unused_import
import '../main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomAppBar(
          color: Colors.white,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 255, 204, 221),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 255, 204, 221),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Flash(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          image: DecorationImage(
            scale: 1.2,
            fit: BoxFit.fill,
            image: ExactAssetImage('assets/images/raster/Swipes2.png'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40.0, 20, 10),
          child: ListView(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Flash()),
                      );
                    },
                    enabled: true,
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(
                          'assets/images/raster/noun-chess-1376847.svg'),
                    ),
                    title: Text('Chess'),
                    subtitle:
                        Text('Lean about the basic of chess opening theory.'),
                    //trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Flash()),
                      );
                    },
                    enabled: true,
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset('assets/images/raster/math.svg'),
                    ),
                    title: Text('Math'),
                    subtitle:
                        Text('From Addition and Subtraction to Calculus.'),
                    //trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Flash()),
                      );
                    },
                    enabled: true,
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child:
                          SvgPicture.asset('assets/images/raster/spanish.svg'),
                    ),
                    title: Text('Spanish'),
                    subtitle: Text('Porque el español no es tu lengua materna'),
                    //trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Flash()),
                      );
                    },
                    enabled: true,
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child:
                          SvgPicture.asset('assets/images/raster/russian.svg'),
                    ),
                    title: Text('Russian'),
                    subtitle: Text('Потому что испанский не твой родной язык'),
                    //trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Flash()),
                      );
                    },
                    enabled: true,
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child:
                          SvgPicture.asset('assets/images/raster/anatomy.svg'),
                    ),
                    title: Text('Anatomy'),
                    subtitle: Text('Head to toe, eveything there is to know.'),
                    //trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Flash()),
                      );
                    },
                    enabled: true,
                    tileColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(
                          'assets/images/raster/philosophy.svg'),
                    ),
                    title: Text('Philosophy'),
                    subtitle:
                        Text('One must imagine Sisyphus happy. - Albert Camus'),
                    //trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
