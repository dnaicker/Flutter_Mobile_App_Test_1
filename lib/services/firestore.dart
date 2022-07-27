import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/rxdart.dart';
import 'auth.dart';
import 'models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get(); // read table once
    var data = snapshot.docs.map(
      (items) => items.data(), // extract raw data and leave metadata
    );

    var topics = data.map(
      (items) => Topic.fromJson(items), // create object classes from JSON data
    );

    return topics.toList();
  }

  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db
        .collection('quizzes')
        .doc(quizId); // retrieving single document rather than collection
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {}); //convert to Quiz object
  }

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      // switch Map is key to switch between user and report tables
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc
            .data()!)); // exclamation mark ! is for null safety check for compiler
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      },
    };

    return ref.set(data, SetOptions(merge: true));
  }
}
