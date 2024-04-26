import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:techub/db/insertion.dart';

class cardfiledo extends StatefulWidget {
  final uid;
  const cardfiledo({Key? key, this.uid});

  @override
  State<cardfiledo> createState() => _cardfiledoState();
}

class _cardfiledoState extends State<cardfiledo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchDatado(widget.uid),
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
                  data![index]["Name"],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Year: ${data![index]["Year"]}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'No of Recruits: ${data![index]["No_of_Recruit"]}',
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
