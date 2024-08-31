import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Padding(
          padding: EdgeInsets.only(top: 20,left: 26),
          child: Icon(Icons.account_circle_sharp,size: 40,color: const Color(0XFF002D62),),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20,right: 26),
          child: Icon(Icons.travel_explore_outlined,size: 40,color: Color(0XFF00001a),),
        ),
      ],),
    );
  }
}
