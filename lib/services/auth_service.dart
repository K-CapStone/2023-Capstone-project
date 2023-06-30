import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class AuthService {
  //Google Sign In
  signInWithGoogle() async {
<<<<<<< Updated upstream
    //begin interactive sign in process
<<<<<<< Updated upstream
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
=======
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? gUser =
        await _googleSignIn.signIn().catchError((onError) {
      print("Error $onError");
      return null;
    });

    if (gUser == null) {
      // Sign in flow canceled.
      return null;
    }
>>>>>>> Stashed changes

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
=======
    try {
      //begin interactive sign in process
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? gUser = await _googleSignIn.signIn();

      if (gUser == null) {
        // Sign in flow canceled.
        return null;
      }

      //obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      //create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      //finally, lets sign in
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
>>>>>>> Stashed changes
  }

  //Google Sign UP
  signUpWithGoogle() async {
    //begin interactive sign in process
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? gUser =
        await _googleSignIn.signIn().catchError((onError) {
      print("Error $onError");
      return null;
    });

    if (gUser == null) {
      // Sign in flow canceled.
      return null;
    }

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //add in db
    final userCollection = FirebaseFirestore.instance.collection("users");

    String? userId = FirebaseAuth.instance.currentUser?.uid;

    final docRef = userCollection.doc(userId);

    await docRef.set({
      "nickname": "",
      "hight": "",
      "weight": "",
      "gender": "",
      "activity level": "",
      "age": ""
    });

    DateTime selectedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String todayDate = selectedDate.toString().substring(0, 10);
    FirebaseFirestore.instance
        .collection("users")
        .doc(docRef as String?)
        .collection(todayDate);

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithKakao() async {
    return null;
  }

  signInWithApple() async {
    return null;
  }
}
