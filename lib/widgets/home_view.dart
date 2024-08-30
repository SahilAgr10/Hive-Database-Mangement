import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'Task_Widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> places = [1, 2,3,4,6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFF002D62),
        onPressed: () {}, // Add your onPressed function here
        child: Icon(Icons.add,color:  Colors.white,size: 20,),
      ),
      body: SliderDrawer(
        slider: Container(
          color: const Color(0XFF002D62),
        ),
        child: homePageUi(),
      ),
    );
  }

  Widget homePageUi() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 120,
            // color: Colors.deepPurple.shade900.withOpacity(0.1),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Color(0XFF002D62),
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        "Planned Trips",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF002D62),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "3 of 8 TRIPS",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, right: 30, bottom: 10),
            child: Divider(
              thickness: 2,
              indent: 55,
            ),
          ),
          Expanded(
            child: places.isNotEmpty
                ? ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final item = places[index];
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    places.removeAt(index);
                    setState(() {});
                  },
                  background: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                      ),
                      Text(
                        "Current Trip is being Deleted",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  key: Key(item.toString()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TaskWidget(),
                  ),
                );
              },
            )
                : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/travel01.jpeg'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Currently No Trips are Added',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
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