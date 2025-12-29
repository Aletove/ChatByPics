import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance; // Istanza di Firestore
  final googleSignIn = GoogleSignIn.instance;
  bool isGoogleSignInInitialized = false;

  AuthService() {
    initializeGoogleSignIn();
  }

  Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        // Se l'email non è verificata, disconnetti l'utente
        await _firebaseAuth.signOut();
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'L\'email non è stata verificata. Controlla la tua casella di posta.',
        );
      }

      // Salva l'utente in Firestore
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Funzione di registrazione con email e password
  Future<UserCredential> signUpWithEmailandPassword(String email, String password) async {
    try {
      // Registrazione con Firebase
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Invia l'email di verifica all'utente appena registrato
      await userCredential.user!.sendEmailVerification();

      // Aggiungi l'utente a Firestore
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }


  // Funzione per il logout
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  // Funzione per controllare se l'utente è autenticato e ha verificato l'email
  User? getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    if (user != null && user.emailVerified) {
      return user;
    }
    return null;
  }

  // Funzione per rinviare l'email di verifica
  Future<void> sendEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    } else {
      throw Exception("L'utente non è disponibile o ha già verificato l'email.");
    }
  }

  Future <void> initializeGoogleSignIn() async {
    try {
      await googleSignIn.initialize();
      isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }
  /// Always check Google sign in initialization before use
  Future<void> ensureGoogleSignInInitialized() async {
    if (!isGoogleSignInInitialized) {
      await initializeGoogleSignIn();
    }
  }


  Future<void> signInWithGoogle({
    String? name,
    String? surname,
    bool isCalledFromLogin = true,
    String? currentUserUid,
    bool isTutor = false,
  }) async {
    await ensureGoogleSignInInitialized();

    // Authenticate with Google
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate(
      scopeHint: ['email'],
    );

    // Get authorization for Firebase scopes if needed
    final authClient = googleSignIn.authorizationClient;
    final authorization = await authClient.authorizationForScopes(['email']);
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(

      accessToken: authorization?.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      final userDocRef = _fireStore.collection('users').doc(user.uid);
      final userDocSnapshot = await userDocRef.get();

      if (!userDocSnapshot.exists) {

        if (name == null || name.isEmpty || surname == null|| surname.isEmpty) {
          await _firebaseAuth.signOut();
          throw Exception("Per completare la registrazione con Google, sono richiesti Nome e Cognome. Esegui la Registrazione.");
        }

        // Logica per i campi 'Tutore' e 'BCC'
        final dynamic tutorField = isCalledFromLogin ? isTutor : currentUserUid;
        final bool bccField = !isCalledFromLogin;

        // Creazione del documento utente (usando i dati aggiuntivi)
        final Map<String, dynamic> userDoc = {
          'email': user.email,
          'nome': name,
          'cognome': surname,
          'Tutore': tutorField,
          'BCC': bccField,
          'uid': user.uid,
          if (!isCalledFromLogin && currentUserUid != null)
            'allowedContacts': [currentUserUid],
        };

        if (isCalledFromLogin) {
          userDoc['friendRequestCount'] = 0;
        }

        // Salva i dati dell'utente su Firestore
        await userDocRef.set(userDoc);

        if (!isCalledFromLogin && currentUserUid != null) {
          DocumentSnapshot tutorDoc = await _fireStore.collection('users').doc(currentUserUid).get();
          // Gestione sicura del campo 'friends'
          List<String> tutorFriends = List<String>.from(tutorDoc.get('friends') as List<dynamic>? ?? []);

          for (String friendId in tutorFriends) {
            await _fireStore.collection('users').doc(friendId).update({
              'friends': FieldValue.arrayUnion([user.uid]),
            });
          }
          await _fireStore.collection('users').doc(currentUserUid).update({
            'bccUsers': FieldValue.arrayUnion([user.uid]),
          });
        }
      }
      // Se l'utente esiste (userDocSnapshot.exists è true), il metodo termina qui con successo.
    } else {
      throw Exception("Accesso non riuscito: nessun utente Firebase ottenuto.");
    }

  }

}
