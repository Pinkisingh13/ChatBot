import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get instance => Get.find();
  late DialogFlowtter dialogFlowtter;
  final textController = TextEditingController();

  final RxList messages = [].obs;
  @override
  void onInit() {
    super.onInit();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      debugPrint('Message is empty');
    } else {
         addMessage(
          Message(
            text: DialogText(text: [text]),
          ),
          true);
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(
          text: TextInput(text: textController.text),
        ),
      );

      if (response.message == null) {
        return null;
      } else {
        addMessage(response.message!);
      }
    }
  }

// This function is going to add text in message with a boolean value
  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
    update();
  }
}
