import 'package:flutter/material.dart';

Future deleteDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            constraints: BoxConstraints(maxHeight: 150),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Text(
                  "Confim delete",
                  style: TextStyle(fontSize: 25),
                ),
                Text("Are you sure want to delete this?"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Text("Cancel"),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Text("Delete"),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future editScreen(
    {required context, required titleController, required descController}) {
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
                  "Edit Task",
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
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Text("Edit"),
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
