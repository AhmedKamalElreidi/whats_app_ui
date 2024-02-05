import 'package:flutter/material.dart';
import 'package:whats_app_ui/core/utils/colors.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.grey, width: 3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "assets/status1.png",
                          height: 60,
                          width: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: const Text(
                      "My Status",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Today, 12:30 am',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.more_vert,
                      color: AppColors.secondaryColor,
                    )),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Updates',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ])));
  }
}
