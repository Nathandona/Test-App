// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Test App';
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      title: _title,
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Connectez vous ou créez un compte.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Addresse email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Afficher le mot de passe',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Switch(
                    value: obscureText,
                    onChanged: (bool value) {
                      setState(() {
                        obscureText = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Mot de passe oublié ?'),
                TextButton(
                  child: const Text(
                    'Reinitialiser',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Se connecter'),
                  onPressed: () {
                    //Connection screen
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Pas de compte ?'),
                TextButton(
                  child: const Text(
                    'Créez un compte',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signupPage()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

class signupPage extends StatelessWidget {
  signupPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Créez un compte.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Addresse email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mot de passe',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirmation mot de passe',
              ),
            ),
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                child: const Text('Continuer'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => confidentialities()),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class confidentialities extends StatefulWidget {
  const confidentialities({Key? key}) : super(key: key);
  @override
  State<confidentialities> createState() => _confidentialities();
}

class _confidentialities extends State<confidentialities> {
  bool is_checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Conditions générales d\'utilisation',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Vivamus euismod, nisi eget consectetur consectetur, nisl nisl '
                'consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '
                'eget consectetur nisl, eget consectetur nisl, eget consectetur nisl, '),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                const Text(
                  'J\'accepte les conditions générales d\'utilisation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: is_checked,
                  onChanged: (bool value) {
                    setState(() {
                      is_checked = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                child: const Text('Continuer'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Créez votre profil',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nom*',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prénom*',
              ),
            ),
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                child: const Text('Terminer l\'inscription'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => confidentialities()),
                  );
                },
              )),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              '*Les champs marqués sont obligatoires',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
