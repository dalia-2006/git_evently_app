import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islami/model/event.dart';
import 'package:islami/model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getUsersCollection(){
    return FirebaseFirestore.instance.collection(MyUser.collectionName)
        .withConverter<MyUser>(
      fromFirestore: (snapshot, options) =>MyUser.fromFireStore(snapshot.data()!),
      toFirestore: (myUser, options) =>myUser.toFireStore(),
    );
  }

  static Future<void> addUserInFireStore(MyUser myUser){
    //todo : 1- collection
    CollectionReference<MyUser> collectionRef = getUsersCollection();
    //todo : 2-document
    DocumentReference<MyUser> documentRef = collectionRef.doc(myUser.uId);
    // todo : 3- add user
    return documentRef.set(myUser);
  }

  static Future<MyUser?> readUserFromFirestore(String uId) async{
    var querySnapshot = await getUsersCollection().doc(uId).get();
    return querySnapshot.data();
  }

  static CollectionReference<Event> getEventCollection (){
    return FirebaseFirestore.instance.collection(Event.collectionName).
    withConverter<Event>(
        fromFirestore: (snapshot, options) =>Event.fromFireStore(snapshot.data()!),
        toFirestore: (event, options) => event.toFireStore(),
    );
  }

  // static Future<void> addEventInFirestore(Event event){
  //   //todo : 1- collection
  //   CollectionReference<Event> collectionRef = getEventCollection();
  //   //todo : 2-document
  //   DocumentReference<Event> documentRef = collectionRef.doc(event.eventId);
  //   // todo : 3- add event
  //   return documentRef.set(event);
  // }

  static Future<void> addEventInFirestore (Event event) {
    //todo : 1- collection
    CollectionReference<Event> collectionRef =getEventCollection();
    //todo : 2-document
    DocumentReference<Event> docRef = collectionRef.doc();
    //todo : 3-update event id
    event.eventId =docRef.id;
    //todo : 4-save event
    return docRef.set(event);
  }

  static Future<void> editEventInFirestore(Event event){
    //todo : 1- collection
    CollectionReference<Event> collectionRef =getEventCollection();
    //todo : 2-document
    DocumentReference<Event> docRef = collectionRef.doc(event.eventId);
    //todo : 3-update event in firestore
    return docRef.update(event.toFireStore());  ///بتدخل تعدل ف الفاير ستور علطول
  }

  static Future<void> deleteEventInFirestore(Event event){
    //todo : 1- collection
    CollectionReference<Event> collectionRef =getEventCollection();
    //todo : 2-document
    DocumentReference<Event> docRef = collectionRef.doc(event.eventId);
    //todo : 3-update event in firestore
    return docRef.delete();  ///بتدخل تعدل ف الفاير ستور علطول
  }

}