import 'package:flutter/material.dart';
import 'package:task_management/viewModel/view_model.dart';

Future addTaskScreen(
    {required context,
    required titleController,
    required descController,
    required ref}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: double.infinity),
      shape: RoundedRectangleBorder(),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Title",
                      label: Text("Title"),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: descController,
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                      hintText: "Desc",
                      label: Text("Desc"),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(counterProvider.notifier).state =
                            titleController.text.toString();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Text("Add Task"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Text("Cancel"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
