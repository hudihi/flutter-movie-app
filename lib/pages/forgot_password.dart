import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  Future forgotPassword() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
        );
        return showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context){
            return const AlertDialog(
                content: Text('Reset password link is send to your email'),
            );
          },
          );
    } on FirebaseAuthException catch(e){
      return showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context){
            return AlertDialog(
                content: Text(e.message.toString()),
            );
          },
      );
    }
  }
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Enter your email, you will be send the reset link in your email!',
              style: TextStyle(
                fontSize: 20.0
              ),
              textAlign: TextAlign.center,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration:  BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    shape: BoxShape.rectangle,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: forgotPassword,
                  color: Colors.deepPurple[200],
                  child: const Text('Reset Password'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}