import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_test/model/note_model.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  
  void addNote(Note n) {
    notes.add(n);
  }
}
