import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:techub/db/insertion.dart';

class cardfileac extends StatefulWidget {
  final uid;
  const cardfileac({Key? key, this.uid});

  @override
  State<cardfileac> createState() => _cardfileacState();
}

class _cardfileacState extends State<cardfileac> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchDataac(widget.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ItemList(
                data: snapshot.data,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final List? data;
  ItemList({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: data == null ? 0 : data!.length,
      itemBuilder: (context, index) {
        print(data![index]["Event_name"] +
            data![index]["Team_Name"] +
            data![index]["Status"]);
        return Card(
          color: Color.fromARGB(255, 255, 243, 192),
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?[index]["Event_name"],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data?[index]["Team_Name"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data?[index]["Status"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
