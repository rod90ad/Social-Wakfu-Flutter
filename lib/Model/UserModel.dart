import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel extends Model{

  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore firestore = Firestore();
  GoogleSignInAccount googleAccount;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();
  //usuario atual
  bool isLoading = true;

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
  }

  Future<GoogleSignInAccount> getSignedInAccount(
    GoogleSignIn googleSignIn) async {
    // Is the user already signed in?
    GoogleSignInAccount account = googleSignIn.currentUser;
    // Try to sign in the previous user:
    if (account == null) {
      account = await googleSignIn.signInSilently();
    }
    return account;
  }

  Future<FirebaseUser> signIntoFirebase(
      GoogleSignInAccount googleSignInAccount) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    GoogleSignInAuthentication googleAuth =
    await googleSignInAccount.authentication;
    return await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  Future<Null> _loadCurrentUser()async{
    googleAccount = await getSignedInAccount(googleSignIn);

    if (googleAccount == null) {
      isLoading = false;
    } else {
      await signInWithGoogle();
    }
    notifyListeners();
  }

  Future<Null> signInWithGoogle() async {
    if (googleAccount == null) {
      // Start the sign-in process:
      googleAccount = await googleSignIn.signIn();
    }
    firebaseUser = await signIntoFirebase(googleAccount);
    isLoading = false;
  }

  Future<Null> _saveUserData(Map<String, dynamic> user) async{
    this.userData = user;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  bool isLoggedIn(){
    return firebaseUser!=null;
  }

  void signOut()async{
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void signIn({@required String email,@required String password,@required VoidCallback onSucess,@required VoidCallback onFail})async{
    isLoading = true;
    notifyListeners();

    await _auth.signInWithEmailAndPassword(email: email, password: password).then((user) async{
      firebaseUser = user;
      await _loadCurrentUser();
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

}