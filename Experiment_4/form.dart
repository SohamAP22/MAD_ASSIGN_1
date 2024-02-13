import 'package:flutter/material.dart';

class Login_form extends StatefulWidget {
  const Login_form({super.key});

  @override
  State<Login_form> createState() => _Login_formState();
}

class _Login_formState extends State<Login_form> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height:150),
          TextFormField(

            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Username';
              }
              return null;
            },

          ),
          SizedBox(height: 8,),
          TextFormField(
            obscureText: true,

            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.password),

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },

          ),
          SizedBox(height: 8,),

          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: Text("Login",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30,),

          Text("Don't have an account ?")
        ],
      ),
    ),
    );
  }
}
