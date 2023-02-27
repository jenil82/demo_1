import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            "Contacts",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.cyan,
        body: Stack(
          children: [
            ListView.builder(
              itemCount: Global.allcontacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: Global.allcontacts[index]);
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  title: Text(
                      "${Global.allcontacts[index].firstname} ${Global.allcontacts[index].lastname}"),
                  subtitle:
                  Text("+91 ${Global.allcontacts[index].phonenumber}"),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    color: Colors.green,
                    onPressed: () {},
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, 'add');
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}