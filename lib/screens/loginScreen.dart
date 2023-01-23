import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,

      child: Column(
        children: [Image.asset("assets/images/login.png",
        fit: BoxFit.cover,

        ),
          SizedBox(
            height: 20,
          ),


        Text(
          "Welcome",
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
            ElevatedButton(
                onPressed: ()
                {print("Login");},
                child: Text("Login"))

          ],
        ),
      )


        ],


      ),
    




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
