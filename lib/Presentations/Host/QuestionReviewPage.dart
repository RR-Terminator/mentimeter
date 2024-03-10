import 'package:flutter/material.dart';
import 'package:mentimeterclone/Providers/room_data_provider.dart';
import 'package:mentimeterclone/Resources/socket_methods.dart';
import 'package:mentimeterclone/Widgets/QuestionReviewField.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  static String routeName = '/review-page';
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();

}




class _ReviewPageState extends State<ReviewPage> {

  void deleteQuestion(int index) {
    SocketMethods().deleteQuestion(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketMethods().deleteQuestionSuccessListener(context);
  }

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

                    return QuestionTile(
                      question: question['question'],
                      options: question['options'],
                      rightOption: question['correctOption'],
                      onTap: () {deleteQuestion(index);},
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
