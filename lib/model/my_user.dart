class MyUser {
  static const String collectionName ='users';
  String uId ;
  String email ;
  String name ;

  MyUser({required this.email, required this.name ,required this.uId});
  /// json => object
MyUser.fromFireStore(Map<String,dynamic>data):this(
  email:data['email'] as String ,
  name:data['name'] as String,
  uId: data['id'] as String
);
 /// object => json
Map <String,dynamic>toFireStore(){
  return {
    'id' : uId ,
    'email': email,
    'name': name
  } ;
}
}