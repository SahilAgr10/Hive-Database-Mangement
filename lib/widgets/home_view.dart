import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_management/models/task.dart';
import 'package:hive_database_management/widgets/Add_Trip/New_Trip_page.dart';
import 'package:hive_database_management/widgets/Custom_Menu.dart';
import '../main.dart';
import 'Task_Widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});



  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
   // loadTasks();
  }



  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
        valueListenable: base.dataStore.listenToTask(),
        builder: (ctx, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(75)),
        elevation: 0,
        backgroundColor: const Color(0XFF00001a),
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (_)=> NewTripPage(taskControllerForTitle: null, task: null,)));
          }, // Add your onPressed function here
        child: const Icon(Icons.add,color:  Colors.white,size: 20,),
        ),
        body: SliderDrawer(
        isDraggable: false,
        appBar: Container(),
        slider: const CustomMenu(),
        child: homePageUi(tasks,base),
        ),
      );
    }
  );
}

  Widget homePageUi(List<Task> tasks, BaseWidget base) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 200,
            //color: Colors.cyan,
            // color: Colors.deepPurple.shade900.withOpacity(0.1),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  margin: const EdgeInsets.only(top: 80),
                  child: const CircularProgressIndicator(
                    color: Color(0XFF002D62),
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 100),
                      child: Text(
                        "Planned Trips",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF000026),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "3 of 8 TRIPS",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only( right: 20),
            child: Divider(
              thickness: 1,
              indent: 55,
            ),
          ),
          Expanded(
            child: tasks.isNotEmpty
                ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var item = tasks[index];
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    base.dataStore.deleteTask(task: item);
                    setState(() {});
                  },
                  background: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: Color(0Xff4A0404),
                      ),
                      Text(
                        "Current Trip is being Deleted",
                        style: TextStyle(color: Color(0Xff4A0404),fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  key: Key(item.toString()),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TaskWidget(task:tasks[index]),
                  ),
                );
              },
            )
                : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/travel01.jpeg'),
                  height: 200,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Currently No Trips are Added',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0Xff000000),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}