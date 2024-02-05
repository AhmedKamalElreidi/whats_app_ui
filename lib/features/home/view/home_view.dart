import 'package:flutter/material.dart';
import 'package:whats_app_ui/core/utils/colors.dart';
import 'package:whats_app_ui/features/home/view/widgets/chat_widget.dart';
import 'package:whats_app_ui/features/home/view/widgets/status_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          // custom height to AppBar
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "WhatsApp",
                style: TextStyle(color: AppColors.white, fontSize: 21),
              ),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 15),
                child: Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              PopupMenuButton(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  iconSize: 28,
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text(
                            "New Group",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text(
                            "New broadCast",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Text(
                            "Linked Devices",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 4,
                          child: Text(
                            "Starred Messages",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 5,
                          child: Text(
                            "settings",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: [
                  // tab 1
                  const SizedBox(
                    width: 20,
                    child: Tab(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // tab 2
                  SizedBox(
                    width: 80,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Chats",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.primaryColor),
                            ),
                          ),
                        ]),
                  ),
                  // tab 3
                  const SizedBox(
                    width: 80,
                    child: Tab(
                      child: Text(
                        "STATUS",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // tab 4
                  const SizedBox(
                    width: 80,
                    child: Tab(
                      child: Text(
                        "CALLS",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: TabBarView(children: [
                // tab 1 camera
                Container(
                  color: Colors.black,
                ),
                // tab 2 chat widget
                const ChatWidget(),
                // tab 3 status widget
                const StatusWidget(),
                // tab 4
                Container(
                  color: Colors.black,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
