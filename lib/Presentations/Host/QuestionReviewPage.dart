import 'package:flutter/material.dart';
import 'package:mentimeterclone/Providers/room_data_provider.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  static String routeName = '/review-page';
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: roomDataProvider.roomData['questions'].length,
                  itemBuilder: (context, index) {
                    var question =
                    roomDataProvider.roomData['questions'][index];

                    return ListTile(
                      title: Text(
                        question['question'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Options: ${question['options']}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Correct Option: ${question['correctOption']}',
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ],
                      ),
                      // Additional widgets or styling can be added as needed
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}