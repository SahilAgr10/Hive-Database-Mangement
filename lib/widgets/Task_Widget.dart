import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){},
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xFF6699CC).withOpacity(0.2)
        ),
        duration: const Duration(milliseconds: 600),

        child: ListTile(
          leading: GestureDetector(onTap: (){},
            child: AnimatedContainer(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
              ),
              duration: const Duration(milliseconds: 600),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.check,color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 10,left: 5),
            child: Text("Bombay",style: TextStyle(
              fontWeight: FontWeight.w500,color: Colors.black,fontSize: 25
            ),),
          ),
          subtitle:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5,top: 9,left: 10),
                child: Text("Description",style: TextStyle(
                  fontWeight: FontWeight.w300,color: Colors.black,fontSize: 12
                ),),
              ),
              Align(alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,top: 1),
                      child: Text("Date visited :",style: TextStyle(
                          fontWeight: FontWeight.w300,color: Colors.black,fontSize: 12
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,top: 1),
                      child: Text("28 March 2020",style: TextStyle(
                          fontWeight: FontWeight.w300,color: Colors.black,fontSize: 12
                      ),),
                    ),
                  ],),
                ),
              )
            ],
          ) ,


        ),
      ),
    );
  }
}