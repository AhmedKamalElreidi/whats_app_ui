import 'package:flutter/material.dart';
import 'package:whats_app_ui/core/model/model.dart';
import 'package:whats_app_ui/core/utils/colors.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            for (int i = 0; i < items.length; i++)
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          items[i].imgPath,
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        items[i].title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Hi, programmer, how are you?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '12:15',
                            style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(18)),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
