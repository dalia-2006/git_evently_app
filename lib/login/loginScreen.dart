import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/widgets/custom_elevated_button.dart';
import 'package:islami/home/widgets/custom_text_field.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/provider/user_provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/dialog_utils.dart';
import 'package:islami/utils/firebase_utils.dart';
import 'package:provider/provider.dart';
import '../provider/app_theme_Provider.dart';
import '../utils/size_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
  TextEditingController(text: "dodosayed060612@gmail.com");

  final TextEditingController passwordController =
  TextEditingController(text: 'dodo2006');

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        AppLocalizations.of(context)!.loginTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  CustomTextField(
                    controller: emailController,
                    errorStyle: AppStyles.reg12Red,
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 28,
                    ),
                    hintStyle: AppStyles.reg14grey,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Email';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text.trim());
                      if (!emailValid) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    controller: passwordController,
                    errorStyle: AppStyles.reg12Red,
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
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please Enter Password';
                      }
                      if (text.length < 6) {
                        return 'Password must be at least 6 chars.';
                      }
                      return null;
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.forgetPasswordRouteName,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
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

                  CustomElevatedButton(
                    onPressed: (){
                      login();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: AppStyles.med20White,
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: AppStyles.reg14grey,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.registerRouteName,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signup,
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
                            AppLocalizations.of(context)!.login,
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

  void login () async{
    if(formKey.currentState!.validate()==true){
      //todo : login
      try{
        //todo : show loading
        // todo : 1- Authentication
        DialogUtils.showLoading(context: context);
            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            // todo : read user from firestore
         var myUser = await FirebaseUtils.readUserFromFirestore(credential.user?.uid ?? '');
         if (myUser==null){
           return ;
         }
         // todo : save user in provider
        var userProvider = Provider.of<UserProvider>(context,listen: false);
         userProvider.updateUser(myUser);
            //todo : hide loading
        DialogUtils.hideLoading(context: context);
        //todo : show message => Success
        DialogUtils.showMessage(context: context,
            content:'Login Successfully',
          title: 'Success',
            posActionName: 'OK',
          negActionName: 'Cancel',
          posAction: (){
          Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
          },
          negAction: (){
          Navigator.pop(context);
          }
        );
      } on FirebaseAuthException catch (e){
        if (e.code == 'invalid-credential'){
          //todo : hide loading
          DialogUtils.hideLoading(context: context);
          //todo : show message => error
          DialogUtils.showMessage(context: context,
              content:'The Supplied Credential is incorrect',
              title: 'error',
              negActionName: 'Cancel',
          );
        }
      }catch(e){
        //todo : hide loading
        DialogUtils.hideLoading(context: context);
        //todo : show message => error
        DialogUtils.showMessage(context: context,
          content:e.toString(),
          title: 'error',
          negActionName: 'Cancel',
        );
      }
    }
  }
}