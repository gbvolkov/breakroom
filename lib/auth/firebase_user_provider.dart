import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BreakroomFirebaseUser {
  BreakroomFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BreakroomFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BreakroomFirebaseUser> breakroomFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<BreakroomFirebaseUser>(
        (user) => currentUser = BreakroomFirebaseUser(user));
