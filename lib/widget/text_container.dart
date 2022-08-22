import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
   String today;
   String country;
  Icon icon;
  String deaths ;
 TextContainer({
    Key? key,
    required this.today,
    required this.country,
    required this.icon,
    required this.deaths,
  }) : super(key: key);

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10.0),
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width * .42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 236, 194, 194),
                Color.fromARGB(255, 233, 222, 222)
              ])),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 241, 192, 192),
                    Color.fromARGB(255, 238, 236, 236)
                  ]),
            ),
            child: widget.icon,
          ),
          SizedBox(height: 10.0),
          Text(widget.today,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800)),
          SizedBox(height: 10.0),
          Text(widget.deaths,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800)),
          SizedBox(height: 10.0),
          Text(widget.country,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade400))
        ],
      ),
    );
  }
}
