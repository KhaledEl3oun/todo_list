import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/note_controller.dart';
import 'package:getx_test/core/text_style.dart';
import 'package:getx_test/model/note_model.dart';

class MyNoteView extends StatelessWidget {
  int? index;
  MyNoteView({super.key, this.index});
  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.find();
    String? text = "";
    text = index == null ? " " : nc.notes[index!].title;
    TextEditingController textEditingController =
        TextEditingController(text: text);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: index == null
                  ? Text(
                      'Create a New Note ',
                      style: TextStyles.styles,
                    )
                  : Text('Update note', style: TextStyles.styles),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Create a new note!!',
                          labelText: ' My Note',
                          labelStyle: const TextStyle(color: Colors.red),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              if (index == null) {
                                nc.notes.add(
                                    Note(title: textEditingController.text));
                              } else {
                                var updatenote = nc.notes[index!];
                                updatenote.title = textEditingController.text;
                                nc.notes[index!] = updatenote;
                              }

                              Get.back();
                            },
                            child: index == null
                                ? const Text('Add')
                                : const Text('Update'),
                          )
                        ])
                  ],
                ),
              ),
            )));
  }
}
