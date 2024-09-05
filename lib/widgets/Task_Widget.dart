import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_database_management/models/task.dart';
import 'package:hive_database_management/widgets/Add_Trip/New_Trip_page.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  const TaskWidget({
    super.key, required this.task,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController taskControllerForTitle = TextEditingController();
  TextEditingController taskControllerForDescription = TextEditingController();


  @override
  void initState() {
    super.initState();
    taskControllerForTitle.text = widget.task.title;
    taskControllerForDescription.text = widget.task.subtitle;
  }

  @override
  void dispose() {
    taskControllerForTitle.dispose();
    taskControllerForDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dateString = '${DateFormat('E, d MMM').format(widget.task.startDate)} - ${DateFormat('E, d MMM').format(widget.task.endDate)}\n${DateFormat('y').format(widget.task.endDate)}';
    return GestureDetector(onTap: (){
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>  NewTripPage(taskControllerForTitle: taskControllerForTitle,taskControllerForDescription:taskControllerForDescription,task: widget.task,)));
    },
      child: AnimatedContainer(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
         color: Colors.blueGrey.shade100
        ),
        duration: const Duration(milliseconds: 600),

        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 110,
                height: 130,
                //margin: EdgeInsets.only(left: 10,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22)
                ),
                child: const ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
                  child: Image(
                    image: AssetImage('assets/images/travel01.jpeg'),
                    height: 100,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
               SizedBox(
                width: 180,
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: Icon(Icons.flight_takeoff_outlined,color: Colors.black54,size: 22,),
                        ),
                        Text( taskControllerForTitle.text,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19,color: Colors.black),),
                      ],
                    ),
                  ),
                   Column(
                     children: [
                       Row(
                         children: [
                           Padding(
                             padding: EdgeInsets.only(right: 6,top: 5),
                             child: Icon(Icons.calendar_month_outlined,color: Colors.black54,size: 22,),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 5),
                             child: Text(dateString,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Colors.black)),
                                //'Mon,25 Jul - Fri,29 july\n 2022'
      ),
                         ],
                       ),
                       SizedBox(height: 12,),
                       Row(children: [
                         Icon(Icons.access_time_outlined,color: Colors.grey,size: 19,),
                         Text('  5 Days ,12 hr',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.grey)),
                       ],)
                     ],
                   )
                ],),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18,right: 20),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Icon(Icons.arrow_forward_ios,size: 20,),
                   SizedBox(height: 50,),
                   Icon(Icons.bookmark_add_outlined,size: 20,),
                  ],
                )
              )///Arrows and Bookmark Icons

            ],
          ),
        ),
      ),
    );
  }
}