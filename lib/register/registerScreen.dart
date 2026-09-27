import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/widgets/custom_elevated_button.dart';
import 'package:islami/home/widgets/custom_text_field.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/model/my_user.dart';
import 'package:islami/provider/user_provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/dialog_utils.dart';
import 'package:islami/utils/firebase_utils.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_Provider.dart';
import '../provider/user_provider.dart';
import '../utils/app_routes.dart';
import '../utils/size_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
  TextEditingController(text: "dalia");

  final TextEditingController emailController =
  TextEditingController(text: "dodosayed060612@gmail.com");

  final TextEditingController passwordController =
  TextEditingController(text: "dodo2006");

  final TextEditingController rePasswordController =
  TextEditingController(text: "dodo2006");

  bool isPasswordVisible = false;
  bool isRePasswordVisible = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    var width = context.width;
    var height = context.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.04,
            horizontal: width * 0.04,
          ),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  Image.asset(
                    themeProvider.appTheme.isDark
                        ? AppAssets.eventlyLogoDark
                        : AppAssets.eventlyLogoLight,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.registerTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  CustomTextField(
                    controller: nameController,
                    hintText: AppLocalizations.of(context)!.enterYourName,
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 28,
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),

                  CustomTextField(
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 28,
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),

                  CustomTextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: AppLocalizations.of(context)!.enterPass,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      size: 28,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 24,
                      ),
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),

                  CustomTextField(
                    controller: rePasswordController,
                    obscureText: !isRePasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: AppLocalizations.of(context)!.confirmPass,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      size: 28,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isRePasswordVisible = !isRePasswordVisible;
                        });
                      },
                      icon: Icon(
                        isRePasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 24,
                      ),
                    ),
                    hintStyle: AppStyles.reg14grey,
                  ),

                  CustomElevatedButton(
                    onPressed: ()  {
                      //todo : register
                      register();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signUp,
                      style: AppStyles.med20White,
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyHaveAnAccount,
                        style: AppStyles.reg14grey,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.loginRouteName,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).cardColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.disableColor,
                          thickness: 2,
                          indent: width * 0.05,
                          endIndent: width * 0.05,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColor.disableColor,
                          thickness: 2,
                          indent: width * 0.05,
                          endIndent: width * 0.05,
                        ),
                      ),
                    ],
                  ),

                  CustomElevatedButton(
                    sideColor: Theme.of(context).canvasColor,
                    backgroundColor: Theme.of(context).dividerColor,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AppAssets.google_logo),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.signUp,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register ()async{
    if(formKey.currentState!.validate() == true ){
      // todo : register
      try{
        // todo : show loading
        // todo : 1- Authentication
        DialogUtils.showLoading(context: context);
            final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

            //todo : 2- save user in firestore
        MyUser myUser = MyUser(
            email:emailController.text ,
            name: nameController.text,
            uId: credential.user?.uid ?? ''
        );
         await FirebaseUtils.addUserInFireStore(myUser);
         /// عملت هنا awaitعلشان اقوله خليك مستني عند السطر ده لحد ما ال يوزر يتعمله save in firestore
           // todo : 3- add user in provider
            var userProvider =Provider.of<UserProvider>( context,listen: false);
            userProvider.updateUser(myUser);
        //todo : hide loading
        DialogUtils.hideLoading(context: context);
        //todo : show message => success
        DialogUtils.showMessage(context: context,
          content:'Register Successfully',
          title: 'success',
          posActionName: 'OK',
          negActionName: 'Cancel',
          posAction:(){
          Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);
          },
          negAction:(){
          Navigator.pop(context);
          } ,
        );
      }on FirebaseAuthException catch(e){
        if (e.code=='weak-password'){
          //todo : hide loading
          DialogUtils.hideLoading(context: context);
          //todo : show message => error
          DialogUtils.showMessage(
              context: context,
              content: 'The Password Provided is too weak' ,
              title: 'Error',
              posActionName: 'OK'
          );
        }else if (e.code == 'email-already-in-use'){
          //todo : hide loading
          DialogUtils.hideLoading(context: context);
          //todo : show message => error
          DialogUtils.showMessage(
              context: context,
              content: 'The Account Already exists for that email.' ,
              title: 'Error',
              posActionName: 'OK'
          );
        }
      }catch(e){
        //todo : hide loading
        DialogUtils.hideLoading(context: context);
        //todo : show message => error
        DialogUtils.showMessage(context: context,
          content: e.toString(),
          title: 'error',
          posActionName: 'OK',
          negActionName: 'Cancel',
        );
      }
    }
  }
}