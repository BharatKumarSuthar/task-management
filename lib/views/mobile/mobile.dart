import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/viewModel/view_model.dart';
import 'package:task_management/views/add_screen.dart';
import 'package:task_management/views/dialog.dart';

/*class Mobile extends StatefulWidget {
  _mobile createState() => _mobile();
}*/

class Mobile extends ConsumerWidget {
  Mobile({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(ref.watch(counterProvider)),
      ),
      body: ListView.builder(
        itemBuilder: (context, item) {
          return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  (item + 1).toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              "Title hfsah bsafg ashfdsd faf",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2),
                            ),
                          )
                        ],
                      ),
                      Text("Status"),
                      Text("Desc"),
                      Text("Created Date"),
                      Text("Completed Date")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          deleteDialog(context);
                        },
                        icon: Icon(Icons.delete),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            editScreen(
                                context: context,
                                titleController: titleController,
                                descController: descController);
                          },
                          icon: Icon(Icons.edit))
                    ],
                  )
                ],
              ));
        },
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          addTaskScreen(
              ref: ref,
              context: context,
              titleController: titleController,
              descController: descController);
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
