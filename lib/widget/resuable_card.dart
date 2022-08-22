import 'package:flutter/material.dart';

class ResuableCard extends StatefulWidget {
 String value;
   String data;
   Color color;
  Icon icon;
  ResuableCard({
    Key? key,
    required this.value,
    required this.data,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  State<ResuableCard> createState() => _ResuableCardState();
}

class _ResuableCardState extends State<ResuableCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  Padding(padding: EdgeInsets.only(left: 2)),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [widget.color, Color.fromARGB(255, 230, 230, 230)])),
            child: widget.icon,
          ),
          Text(
            widget.value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: widget.color),
          ),
          SizedBox(
            width: 30.0,
          ),
          Text(
            widget.data,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
          SizedBox(
            width: 0.2,
          ),
        ],
      ),
    );
  }
}
