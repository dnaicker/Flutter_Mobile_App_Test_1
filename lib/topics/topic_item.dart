import 'package:flutter/material.dart';
import '../services/models.dart';
import '../shared/progress_bar.dart';
import 'draw.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;

  const TopicItem({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      // is an invisible animation
      tag: topic.img,
      child: Card(
        // requires card layout
        clipBehavior: Clip.antiAlias, // round the edges of images
        child: InkWell(
          // handles tapping on parent
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TopicScreen(topic: topic),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 3,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/covers/${topic.img}',
                      fit: BoxFit.contain, // fitting size using box fit
                    ),
                  )),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade, // gradient over text to fade
                    softWrap: false,
                  ),
                ),
              ),
              Flexible(child: TopicProgress(topic: topic)),
            ],
          ),
        ),
      ),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Topic topic;
  const TopicScreen({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Hero(
            tag: topic.img,
            child: Image.asset('assets/covers/${topic.img}',
                width: MediaQuery.of(context).size.width),
          ),
          Text(
            topic.title,
            style: const TextStyle(
                height: 2, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          QuizList(topic: topic)
        ],
      ),
    );
  }
}
