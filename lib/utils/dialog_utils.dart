import 'package:flutter/material.dart';

class DialogUtils {
 static void showLoading({required BuildContext context}){
   showDialog(
     barrierDismissible: false,
       context: context,
       builder: (context){
         return AlertDialog(
           content: Row(
             spacing: 8,
             children: [
               CircularProgressIndicator(
                 color: Theme.of(context).cardColor,
               ),
               Text('Loading...',style: Theme.of(context).textTheme.titleLarge,),
             ],
           ),
         );
       }
   );
 }

 static void hideLoading ({required BuildContext context}){
   Navigator.pop(context);
 }

 static void showMessage({
   required BuildContext context,
   String title = '',
   required String content,
   String? posActionName,
   VoidCallback? posAction,
   String? negActionName,
   VoidCallback? negAction,
 }){
   List<Widget>actions =[];
   if (posActionName != null ){
     actions.add(TextButton(onPressed: (){
       Navigator.pop(context);
       if(posAction != null){
         posAction.call();
       }
       posAction?.call();
     },
         child:Text(posActionName)));
   }
   if(negActionName != null){
     actions.add(TextButton(
         onPressed: (){
           Navigator.pop(context);
           negAction?.call();
         },
         child: Text(negActionName,style:Theme.of(context).textTheme.titleMedium,)));
   }
   showDialog(
       context: context,
       builder: ((context) {
         return AlertDialog(
           content: Text(content,style: Theme.of(context).textTheme.titleLarge,),
           title: Text(title,style: Theme.of(context).textTheme.titleLarge,),
           actions: actions,
         );
       }),
   );
 }

}