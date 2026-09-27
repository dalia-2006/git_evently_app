  import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';

  String eventId ;
  String eventImage ;
  String eventName ;
  String eventTitle ;
  String eventDescription ;
  DateTime eventDate ;
  bool isFavourite ;
  int eventCategoryIndex ;

  Event({
    this.eventId = '' ,
    required this.eventImage,
    required this.eventName,
    required this.eventTitle ,
    this.isFavourite = false ,
    required this.eventDate,
    required this.eventDescription,
    required this.eventCategoryIndex
  });
  Event.fromFireStore(Map<String ,dynamic>data): this(
    eventDate: (data['event_date'] as Timestamp).toDate(),
    eventDescription: data['event_description'] as String ,
    eventImage: data['event_image'] as String ,
    eventName:data['event_name'] as String,
    eventTitle: data['event_title'] as String,
    isFavourite:data['is_favourite']  ,
    eventId:data['event_id'] as String,
    eventCategoryIndex: data['event_category_index']
  );

  Map<String,dynamic>toFireStore(){
    return{
      'event_id':eventId ,
      'event_image':eventImage ,
      'event_name':eventName ,
      'event_description':eventDescription ,
      'event_title':eventTitle ,
      'event_date':eventDate ,
      'is_favourite':isFavourite ,
      'event_category_index':eventCategoryIndex
    };
  }
  }