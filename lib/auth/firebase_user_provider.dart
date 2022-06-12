import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Actividad8FirebaseFirebaseUser {
  Actividad8FirebaseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Actividad8FirebaseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Actividad8FirebaseFirebaseUser> actividad8FirebaseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Actividad8FirebaseFirebaseUser>(
            (user) => currentUser = Actividad8FirebaseFirebaseUser(user));
