import 'package:flutter/material.dart';

void main () {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget {
  final TextEditingController userCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
    appBar:AppBar(
      title:const Text('FirstPage'),
      backgroundColor:Colors.deepOrangeAccent
    ),
    body:ListView(
    padding:const EdgeInsets.all(20),
    children:[
      TextFormField(
        controller:userCon,
        keyboardType:TextInputType.text,
        decoration:const InputDecoration(
        labelText: 'username'
        )
      ),
      const SizedBox(height:20),
      TextFormField(
        obscureText: true,
        controller: passCon,
        keyboardType:TextInputType.visiblePassword,
        decoration:const InputDecoration(
        labelText:'password',
      )
      ),
      const SizedBox(height:20),
      OutlinedButton(
        onPressed:() {
          
          String username = userCon.text;
          String password = passCon.text;
          Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context) => SecondPage(username, password)
                        )
                        );
          
        },child:const Text('login')
      )
      
      
    ]
    )  
    );
  }
}

class SecondPage extends StatelessWidget {
  final String username;
  final String password;
  const SecondPage(this.username, this.password);
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('SecondPage'),
        backgroundColor:Colors.limeAccent,
      ),
      
      body:Center(
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Text('Welcome user $username!'),
        Text('Your password: $password')
        
      ]
      )
      )
    );
  }
}