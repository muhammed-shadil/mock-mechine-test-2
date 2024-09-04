import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mechine_test2/controller/authentication/bloc/auth_bloc.dart';
import 'package:mock_mechine_test2/model/usermodel.dart';
import 'package:mock_mechine_test2/utils/constants.dart';
import 'package:mock_mechine_test2/view/screens/autherntication/signin_screen.dart';
import 'package:mock_mechine_test2/view/screens/autherntication/widgets/mainbutton.dart';
import 'package:mock_mechine_test2/view/screens/autherntication/widgets/maintextfield.dart';

class Signupwrapper extends StatelessWidget {
  const Signupwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthenticatedError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is Authenticated) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("state.message")));

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const signinwrapper()));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 14),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: constants.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MainTextfield(
                        controller: emailcontroller,
                        preicon: Icons.email_outlined,
                        hinttext: "Please enter your email",
                        namefield: "Email",
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid email";
                          } else if (!constants.regemail.hasMatch(value)) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    MainTextfield(
                      controller: passwordcontroller,
                      preicon: Icons.lock,
                      hinttext: "Please enter your password",
                      namefield: "Password",
                      keyboard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else if (!constants.password.hasMatch(value)) {
                          return 'Password should contain at least one upper case, one lower case, one digit, one special character and  must be 8 characters in length';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MainTextfield(
                        controller: fullnamecontroller,
                        preicon: Icons.person_3_outlined,
                        hinttext: "Please enter your full name",
                        namefield: "Full name",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          } else if (!constants.name.hasMatch(value)) {
                            return "Enter a valid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: MainTextfield(
                        controller: usernamecontroller,
                        preicon: Icons.person_search_sharp,
                        hinttext: "Please enter your User name",
                        namefield: "User name",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          } else if (!constants.name.hasMatch(value)) {
                            return "Enter a valid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return MainButton(
                                onpressed: () {},
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Signing up",
                                      style: styles.textfieldhintstyle,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          color: constants.white,
                                        )),
                                  ],
                                ));
                          }
                          return MainButton(
                            child: const Text("Sign up",
                                style: styles.mainbuttontext),
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                final users = Usermodel(
                                    phone: fullnamecontroller.text,
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    username: usernamecontroller.text);
                                BlocProvider.of<AuthBloc>(context)
                                    .add(SignUpEvent(user: users));
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
