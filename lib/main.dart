import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_management/widgets/home_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/hive_data_store.dart';
import 'models/task.dart';


Future<void> main() async {

  await Hive.initFlutter(); /// Initial Hive DB
  Hive.registerAdapter<Task>(TaskAdapter());  /// Register Hive Adapter
  var box = await Hive.openBox<Task>("tasksBox");  /// Open box

  /// Delete data from previous day
  // // ignore: avoid_function_literals_in_foreach_calls
  // box.values.forEach((task) {
  //   if (task.createdAtTime.day != DateTime.now().day) {
  //     task.delete();
  //   } else {}
  // });

  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  @override
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}


