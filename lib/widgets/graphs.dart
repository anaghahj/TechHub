import 'package:flutter/material.dart';
import 'package:techub/dashboard/bargraph.dart';
import 'package:techub/dashboard/piegraph.dart';

class Graphs extends StatefulWidget {
  final uid;
  const Graphs({Key? key, this.uid});

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildGraphContainer(
            title: 'Placement Records',
            graphWidget: bargraphe(uid: widget.uid),
          ),
          _buildGraphContainer(
            title: 'Domains',
            graphWidget: PieGraph(uid: widget.uid),
          ),
        ],
      ),
    );
  }

  Widget _buildGraphContainer(
      {required String title, required Widget graphWidget}) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.91,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     const Color.fromARGB(255, 255, 208, 0),
        //     const Color.fromARGB(255, 255, 225, 89),
        //     const Color.fromARGB(255, 255, 215, 166),
        //   ],
        // ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 243, 192),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 30, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(child: graphWidget),
        ],
      ),
    );
  }
}
