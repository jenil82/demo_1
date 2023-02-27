import 'package:flutter/material.dart';

import 'modal.dart';
class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Contact c1 = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Contacts",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                width: 100,
                child: Positioned(
                  bottom: 5,
                  right: 5,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${c1.firstname} ${c1.lastname}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "+91 ${c1.phonenumber}",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${c1.email}",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}