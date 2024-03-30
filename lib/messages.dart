import 'package:chatbot/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

    return Obx(
      () => ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: controller.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomRight: Radius.circular(
                        controller.messages[index]['isUserMessage'] ? 0 : 20,
                      ),
                      topLeft: Radius.circular(
                          controller.messages[index]['isUserMessage'] ? 20 : 0),
                    ),
                    color: controller.messages[index]['isUserMessage']
                        ? Colors.grey.shade800
                        : Colors.grey.shade900.withOpacity(0.8),
                  ),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  child: Text(
                    controller.messages[index]['message'].text.text[0],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => const Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        itemCount: controller.messages.length,
      ),
    );
  }
}
