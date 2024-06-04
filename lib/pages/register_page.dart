import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  bool confirmation(){
    if (_confirmationController.text.trim() == _passwordController.text.trim()) {
      return true;
    }
    else {
      return false;
    }
  }

  Future signUp() async {
    if (confirmation()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SafeArea(
        child:  Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 100.0,
                ),
                const SizedBox(height: 30.0,),
              //Hello again
              const Text('Hello there!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            
              const SizedBox(height: 20,),
              
              const Text('Register below with your details!',
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            const SizedBox(height: 25,),
              //email Textfield
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
              const SizedBox(height: 20,),
              //password textfield
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
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            
            //confirm password field
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
                    controller: _confirmationController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'confirm password',
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              
              //sign in  button
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(
                  right: 10,
                  left: 40
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Padding(
                  padding:  const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child:  GestureDetector(
                    onTap: signUp,
                    child: const Text('Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
                ),
              ),
            
              //not a member register
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('I am a member '),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text('Login now', style: TextStyle(
                      color: Colors.blue,
                    ),
                    ),
                  ),
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}