import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Início'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Suporte LaraNet"),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Color.fromRGBO(10, 176, 85, 1),
      ),
      body: Center(
        child: Container(
          child: Text("Essa a tela de home :)"),
        ),
      ),
    );
  }
}
