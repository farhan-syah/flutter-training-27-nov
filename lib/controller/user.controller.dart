import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user.model.dart';

class UserController extends GetxController {
  User? user;

  UserController() {
    retrieveUser();
  }

  retrieveUser() {
    user = FirebaseAuth.instance.currentUser;
  }
}
