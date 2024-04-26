import 'package:flutter/material.dart';
import 'package:techub/widgets/list_uni.dart';

class feed extends StatefulWidget {
  final List? list;

  feed(this.list);

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    print("recieved");
    print(widget.list);
    return ListView.builder(
        itemCount: widget.list == null ? 0 : widget.list!.length,
        itemBuilder: (context, i) {
          return Container(
              color: Colors.amber[50],
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  listuni(
                    widget.list![i]['No_of_Students'],
                    widget.list![i]["Uid"],
                    widget.list![i]['NAAC_Credits'],
                    widget.list![i]['TPO'],
                    widget.list![i]['TPO_Phone'],
                    widget.list![i]['MOU_Signed'],
                    widget.list![i]['Score'],
                    widget.list![i]['Name'],
                  )
                ],
              ));
        });
  }
}
