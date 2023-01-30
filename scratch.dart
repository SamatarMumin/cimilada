import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  task2();
  String data = await task2();
  task3(data);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result = '';
   await Future.delayed(threeSeconds, () {
    print('Task 2 complete');
    result = 'data';
  }
  );
  return result;
}

void task3(String Task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $Task2Data');
}