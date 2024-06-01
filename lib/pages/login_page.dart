
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key,
  required this.showRegisterPage
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn () async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
      );
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
              const Text('Hello Again!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            
              const SizedBox(height: 10,),
              
              const Text('Welcome back, you\'ve been missed!',
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
              const SizedBox(height: 10,),
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
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                            return const SizedBox();
                            },
                            ),
                          );
                      },
                      child: Text(
                        'forgot password?',
                        style: TextStyle(
                          color: Colors.blue[500]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0,),
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
                    onTap: signIn,
                    child: const Text('Sign In',
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
                  const Text('No a member? '),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text('Register now', style: TextStyle(
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