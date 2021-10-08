import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    String username = await Future.delayed(Duration(seconds: 2), (){
      return 'Malash';
    });

    String bio = await Future.delayed(Duration(seconds: 3), (){
      return 'A software developer';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('App started');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Choose Location"),
    );
  }
}
