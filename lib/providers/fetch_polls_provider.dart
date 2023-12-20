import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FetchPollsProvider extends ChangeNotifier{
  List<DocumentSnapshot> _pollsList = [];
  List<DocumentSnapshot> _usersPollsList = [];

  bool _isLoading = true;
  bool get isLoading =>_isLoading;

  List<DocumentSnapshot> get  pollsList => _pollsList;
  List<DocumentSnapshot> get  userPollsList => _usersPollsList;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference pollCollection = FirebaseFirestore.instance.collection("polls");

  //// Fetch all Polls
  void fetchAllPolls() async {
    pollCollection.get().then((value){
      if(value.docs.isEmpty){
        _pollsList = [];
        _isLoading = false;
        notifyListeners();
      } else{
        final data = value.docs;
        _pollsList = data;
        _isLoading = false;// true hona chahiye shayad
        notifyListeners();
      }
    });
  }

  //Fetch user Polls
  void fetchUserPolls() async {
    pollCollection.get().then((value){
      if(value.docs.isEmpty){
        _usersPollsList = [];
        _isLoading = false;
        notifyListeners();
      } else{
        final data = value.docs;
        for( var i in data)
          {
            if(i.get("author")["uid"]==user!.uid){
              _usersPollsList = [];
              _isLoading = false;
              notifyListeners();
            }
          }
      }
    });
  }
}