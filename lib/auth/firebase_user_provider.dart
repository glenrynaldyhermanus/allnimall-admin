import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AdminFirebaseUser {
  AdminFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AdminFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AdminFirebaseUser> adminFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AdminFirebaseUser>(
      (user) {
        currentUser = AdminFirebaseUser(user);
        return currentUser!;
      },
    );
