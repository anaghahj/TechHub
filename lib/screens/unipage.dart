import 'package:flutter/material.dart';
import 'package:techub/dashboard/cardfileac.dart';
import 'package:techub/dashboard/cardfiledo.dart';
import 'package:techub/widgets/graphs.dart';
import 'package:techub/widgets/unipagedaetails.dart';

class unipage extends StatefulWidget {
  final uid;
  const unipage({Key? key, this.uid});

  @override
  State<unipage> createState() => _unipageState();
}

class _unipageState extends State<unipage> {
  @override
  Widget build(BuildContext context) {
    print("hi" + widget.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 208, 0),
        elevation: 4,
        centerTitle: true,
        title: Text("Universities", style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          Container(child: unipaged(uid: widget.uid)),
          SizedBox(height: 20),
          Graphs(uid: widget.uid),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Achievements",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 210,
            child: cardfileac(uid: widget.uid),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Companies",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: cardfiledo(uid: widget.uid),
          ),
        ],
      ),
    );
  }
}
