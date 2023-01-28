import 'package:flutter/material.dart';
import 'package:project1/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  final _formKey = GlobalKey<FormState>();

  bool changedButton = false;
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child : SingleChildScrollView(
        child:Form(
          key: _formKey,
            child: Column(
              children: [Image.asset("assets/images/login.png",
                fit: BoxFit.cover,

              ),
                const SizedBox(
                  height: 20,
                ),


                Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter Username",
                          hintText: "Username",
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                        },
                        onChanged: (value){
                          name = value;
                          setState(() {

                          });
                        },
                      ),

                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Enter Password",
                          hintText: "Password",
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          else if(value.length<6){
                            return "Password must be longer than 6";
                          }
                        },

                      ),

                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.indigo,
                      borderRadius:
                      BorderRadius.circular(changedButton ? 50 : 8),
                      child: InkWell(
                        // splashColor: Colors.red,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton ? 50 : 150,
                          height: 50,
                          // color: Colors.indigo,
                          alignment: Alignment.center,
                          child: changedButton
                              ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                              : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell (
                            //   onTap:  () async => moveToHome(context) ,
                            //
                            //   child: AnimatedContainer(
                            //     duration: const Duration(seconds: 1),
                            //     width: changedButton? 50  : 150,
                            //     height: 50,
                            //     alignment: Alignment.center,
                            //     decoration: BoxDecoration(
                            //       color: Colors.deepPurple,
                            //       borderRadius: BorderRadius.circular(10) ,
                            //     ),
                            //     child:
                            //     changedButton
                            //         ?const Icon(Icons.done)
                            //         :const Text("Login",
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 18,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // ElevatedButton(
                            //   style: TextButton.styleFrom(minimumSize: Size(50, 50)),
                            //     onPressed: ()
                            //     {
                            //       Navigator.pushNamed(context, MyRoute.homeRoute);
                            //
                            //       },
                            //     child: Text("Login")),


                        )
                      )
                    )
                    ],
                  ),
                )


              ],


            )
        )

        ,

      )


    //   child: Center(
    //     child: Text("Login",
    //     style: TextStyle(
    //       fontSize: 20,
    //       color: Colors.blue,
    //       fontWeight: FontWeight.bold,
    //     ),
    // ),
    // ),
    );

  }
}
