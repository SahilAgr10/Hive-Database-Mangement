import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskAppbar extends StatefulWidget implements PreferredSizeWidget {
  const AddTaskAppbar({super.key});

  @override
  State<AddTaskAppbar> createState() => _AddTaskAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(150);
}

class _AddTaskAppbarState extends State<AddTaskAppbar>{
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          GestureDetector(
              onTap:(){
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 20,left: 20),
                child: Icon(Icons.arrow_back,size: 30,color: Color(0Xff4A0404),),
              ))
        ],
      ),
    );
  }
}
