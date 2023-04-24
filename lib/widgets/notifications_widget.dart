import 'package:flutter/material.dart';
import '../providers/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final notData = Provider.of<NotificationProvider>(context, listen: false);

    return Consumer<NotificationProvider>(builder: (context, notifier, child) {
      if (notifier.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Image.network(
                  //   "${notifier.notifications.backimage}",
                  //   fit: BoxFit.cover,
                  //   height: 380,
                  // ),
                  Positioned(
                    top: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${notifier.notifications.projects}'),
                                  const Text('Projects')
                                ],
                              )),
                        ),
                        const SizedBox(
                          width: 210,
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${notifier.notifications.stars}'),
                                const Text('Stars')
                              ],
                            ))
                      ],
                    ),
                  ),
                  const Positioned(
                      top: 220,
                      left: 170,
                      child: Text(
                        'CJ',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                  const Positioned(
                      top: 245,
                      left: 100,
                      child: Text(
                        'Engineer .Designer .Developer',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const Text('What\'s new'),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) => Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notifier.notifications.notifications?[index]
                                      .title ??
                                  '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(notifier.notifications.notifications?[index]
                                    .description ??
                                ''),
                            Text(
                                'Received on:${notifier.notifications.notifications?[index].date ?? ''}')
                          ],
                        ),
                      ),
                    )),
                itemCount: notifier.notifications.notifications?.length ?? 0,
              ),
            ),
          ],
        ),
      );
    });
  }
}
