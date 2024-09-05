import 'package:flutter/material.dart';
import '../../Utilities/constants.dart';
import '../../Utilities/strings.dart';
import '../../data/hive_data_store.dart';
import '../../main.dart';
import '../../models/task.dart';
import '../../models/task.dart';
import 'AddTaskAppbar.dart';
import 'package:intl/intl.dart';

class NewTripPage extends StatefulWidget {
  NewTripPage({
    super.key,
    required this.taskControllerForTitle,
    this.taskControllerForDescription,
    required this.task,
  });

  TextEditingController? taskControllerForTitle;
  TextEditingController? taskControllerForDescription; // Add description controller
  final Task? task;

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  var title='';
  var description='';
  DateTime? startDate;
  DateTime? endDate;
  var startDateStr='Start Date';
  var endDateStr ='End Date';

  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      title = widget.task!.title;
      description = widget.task!.subtitle ?? ''; // Initialize description
      startDate = widget.task!.startDate;
      endDate = widget.task!.endDate;
      startDateStr = DateFormat('dd MMM yyyy').format(startDate!);
      endDateStr = DateFormat('dd MMM yyyy').format(endDate!);
    }
  }


  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AddTaskAppbar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTopText(),
              buildMiddleWidgets(context, textTheme),
              buildBottomButtons(context)],),)),);
  }

  isTaskAlreadyExistBool() {
    return false;
  }
  SizedBox buildTopText() {
    return const SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 40,
            child: Divider(thickness: 2,),),
          Text(
            MyString.addNewTask,
            style: TextStyle(
                color: Color(0Xff4A0404),
                fontWeight: FontWeight.w500,
                fontSize: 24),),
          SizedBox(width: 40,
            child: Divider(thickness: 2,),),],),);
  }
  SizedBox buildMiddleWidgets(BuildContext context, TextTheme textTheme) {
    return SizedBox(
      width: double.infinity, height: 535,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: widget.taskControllerForTitle,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon:
                  const Icon(Icons.mode_of_travel, color: Color(0Xff4A0404)),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: MyString.addNote,
                ),
                onFieldSubmitted: (value) {
                  title=value;
                  print(title);
                },onChanged: (value){
                  title=value;
                },
              ),
            ),
          ),/// Add destination TextField
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(MyString.titleOfTitleTextField,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17)),
          ), /// Title of TextFiled
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: widget.taskControllerForDescription,
                maxLines: 6,
                cursorHeight: 20,
                cursorColor: const Color(0Xff4A0404),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),hintText: MyString.descriptionText,
                  hintStyle: TextStyle(fontSize: 13,)
                ),
                onFieldSubmitted: (value) {
                  // title = value;
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  // title = value;
                },
              ),
            ),
          ),/// Description TextField
          const SizedBox(
            height: 10,
          ),

          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2030),
              );
              if (pickedDate != null) {
                setState(() {
                  startDate = pickedDate; // Set the picked date
                  startDateStr = DateFormat('dd MMM yyyy').format(pickedDate); // Format the date
                  print(startDateStr); // Optional: Print the date string for debugging
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(MyString.startDateString),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 130,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                    child:  Center(
                      child: Text(
                        startDateStr,
                        style: TextStyle(color: Color(0Xff4A0404)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),/// Start DateTime Picker
          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2030),);
              if (pickedDate != null) {
                setState(() {
                  endDate = pickedDate;
                  endDateStr = DateFormat('dd MMM yyyy').format(pickedDate);
                  print(endDateStr);
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.endDateString,
                      //style: textTheme.headline5
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 130,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Center(
                      child: Text(
                        endDateStr,
                        style: const TextStyle(color: Color(0Xff4A0404)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ) /// End DateTime Picker
        ],
      ),
    );
  }
  Padding buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: isTaskAlreadyExistBool()
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 55,
            decoration: BoxDecoration(
                border:
                Border.all(color: const Color(0Xff4A0404), width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minWidth: 150,
              height: 55,
              onPressed: () {
                // deleteTask();
                Navigator.pop(context);
              },
              color: Colors.white,
              child: const Row(
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Color(0Xff4A0404),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    MyString.deleteTask,
                    style: TextStyle(
                      color: Color(0Xff4A0404),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minWidth: 150,
            height: 55,
            onPressed: ()  async {
              // print(title);
              // print(startDateStr);
              // print(endDateStr);
              // Create a Task object from the user's input
              if(widget.taskControllerForTitle?.text != null){
                try {
                  widget.taskControllerForTitle?.text = title;
                  //widget.task!.title = title;
                  widget.task!.subtitle = description; // Save description
                  widget.task!.startDate = startDate!;
                  widget.task!.endDate = endDate!;
                  widget.task?.save();
                  Navigator.of(context).pop();
                } catch (error) {
                  nothingEnterOnUpdateTaskMode(context);
                }
              }else{
                if(title.isNotEmpty&& title!=null) {
                  Task newTask = Task.create(
                    title:title,
                    subtitle: "", // Add your logic to handle this
                    startDate:startDate, // Start Date as creation date
                    endDate: endDate, // End Date or any other logic
                  );
                  BaseWidget.of(context).dataStore.addTask(task: newTask);// Save the task using HiveDataStore
                  Navigator.pop(context);
                }else{
                  print('no value');
                  emptyFieldsWarning(context);
                }
              }




            },
            color: const Color(0Xff4A0404),
            child: Text(
              isTaskAlreadyExistBool()
                  ? MyString.addTaskString
                  : MyString.updateTaskString,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),/// Add or Update Task Button
        ],
      ),
    );
  }
}


