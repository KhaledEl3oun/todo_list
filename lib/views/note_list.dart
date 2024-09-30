import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/note_controller.dart';
import 'package:getx_test/core/text_style.dart';
import 'package:getx_test/views/my_note_view.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.put(NoteController());
    Widget getNoteList() {
      return Obx(
        () => nc.notes.isEmpty
            ? Center(
                child: Image.asset('assets/lists.jpeg'),
              )
            : ListView.builder(
                itemCount: nc.notes.length,
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                          title: Text(nc.notes[index].title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                          leading: Text(
                            "${index + 1}.",
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: Wrap(children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.create),
                                onPressed: () =>
                                    Get.to(MyNoteView(index: index))),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: 'Delete Note',
                                      middleText: nc.notes[index].title!,
                                      onCancel: () => Get.back(),
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        nc.notes.removeAt(index);
                                        Get.back();
                                      });
                                })
                          ])),
                    )),
      );
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.red,
              centerTitle: true,
              title: Text(
                'Todo App',
                style: TextStyles.styles,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(MyNoteView());
              },
            ),
            body: Container(
              child: Padding(
                  padding: const EdgeInsets.all(5), child: getNoteList()),
            )));
  }
}
