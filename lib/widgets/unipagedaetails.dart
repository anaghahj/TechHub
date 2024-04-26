import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:techub/dashboard/stats.dart';
import 'package:techub/db/insertion.dart';
import 'package:techub/screens/Welcomescreen.dart';
import 'package:techub/widgets/graphs.dart';

class unipaged extends StatefulWidget {
  final uid;
  const unipaged({super.key, this.uid});

  @override
  State<unipaged> createState() => _unipagedState();
}

class _unipagedState extends State<unipaged> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchDatauni(widget.uid),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ItemList(
                list: snapshot.data,
              )
            : Center(
                child: new CircularProgressIndicator(),
              );
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    print("bande");
    print(list);
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Card(
          color: Color.fromARGB(255, 255, 243, 192),
          //color: Color.fromRGBO(255, 255, 243, 0),
          margin: EdgeInsets.all(16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list![i]["Name"],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoSlab',
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Stats("Students", list![i]["No_of_Students"].toString()),
                    Stats("NAAC", list![i]["NAAC_Credits"]),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
