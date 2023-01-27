import 'package:flutter/material.dart';
import 'package:project1/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child : SingleChildScrollView(
        child: Column(
          children: [Image.asset("assets/images/login.png",
            fit: BoxFit.cover,

          ),
            SizedBox(
              height: 20,
            ),


            Text(
              "Welcome $name",
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Username",
                      hintText: "Username",
                    ),
                    onChanged: (value){
                      name = value;
                      setState(() {

                      });
                    },
                  ),

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      hintText: "Password",
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell (
                    onTap:  () async
                    {
                      setState(() {
                        changedButton=true;
                      });
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pushNamed(context, MyRoute.homeRoute);
                    }
                    ,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changedButton? 50  : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child:
                        changedButton
                            ?Icon(Icons.done)
                            :Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                ),
                              ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10) ,
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   style: TextButton.styleFrom(minimumSize: Size(50, 50)),
                  //     onPressed: ()
                  //     {
                  //       Navigator.pushNamed(context, MyRoute.homeRoute);
                  //
                  //       },
                  //     child: Text("Login")),
                ],
              ),
            )


          ],


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
