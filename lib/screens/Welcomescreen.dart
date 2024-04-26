import 'package:flutter/material.dart';
import 'package:techub/db/insertion.dart';
import 'package:techub/screens/add_screen.dart';
import 'package:techub/screens/unipage.dart';
import 'package:techub/widgets/feed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class welcome extends StatefulWidget {
  const welcome({Key? key});
  static const id = "welcome";
  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 208, 0),
          centerTitle: true,
          title: Image.asset(
            "assets/logo/logo.png",
            fit: BoxFit.cover,
            scale: 15,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle_outlined),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => UniversityForm())),
            )
          ],
        ),
        backgroundColor: Colors.amber[50],
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));

            return snapshot.hasData
                ? feed(
                    snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        print("welcome:" + list![i]["Uid"]);
        return Container(
          padding: EdgeInsets.all(8),
          height: 151,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(children: [
            Center(
              child: Text(
                list![i]["Name"],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                overflow: TextOverflow.clip,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Students:" + list![i]["No_of_Students"],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  "Naac Credits:" + list![i]["NAAC_Credits"],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "TPO:" + list![i]['Name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  "TPO Phone number:" + list![i]['Name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "MOU's Signed:" + list![i]['Name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(
                  "Points:" + list![i]['Name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 0, 0, 0)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 255, 244, 195))),
                  onPressed: () {
                    print("welcome:" + list![i]["Uid"]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => unipage(uid: list![i]["Uid"])));
                  },
                  child: Text("View"),
                )
              ],
            )
          ]),
        );
        // Container(
        //       padding: const EdgeInsets.all(10.0),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: Card(
        //           child: ListTile(
        //             title: Text(
        //               list![i]['Name'],
        //               style: TextStyle(fontFamily: "Netflix"),
        //             ),
        //             leading: Icon(Icons.widgets),
        //             subtitle: Text("Students : ${list![i]['No_of_students']}"),
        //           ),
        //         ),
        //       ),
        //     );
      },
    );
  }
}
