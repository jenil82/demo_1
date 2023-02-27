import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'modal.dart';


class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController firstnamec = TextEditingController();
  TextEditingController lastnamec = TextEditingController();
  TextEditingController phonenumberc = TextEditingController();

  String? firstname;
  String? lastname;
  String? phonenumber;


  GlobalKey<FormState> contactkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: Text(
              "Add",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    if (contactkey.currentState!.validate()) {
                      contactkey.currentState!.save();

                      Contact c1 = Contact(
                        firstname: firstname,
                        lastname: lastname,
                        phonenumber: phonenumber,
                      );
                      setState(() {
                        Global.allcontacts.add(c1);
                      });

                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    }
                  },
                  icon: Icon(Icons.check),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.cyan,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
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
                              CupertinoIcons.camera,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: firstnamec,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your First Name...";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        firstname = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: lastnamec,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Last Name...";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        lastname = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Last Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: phonenumberc,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Number...";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        phonenumber = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "+91",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}