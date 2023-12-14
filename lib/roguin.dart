import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ログイン画面',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ログイン
  void _signIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // ユーザー情報の検証
    if (email == 'kame' && password == 'pass') {
      _showMessage('ログイン成功');
    } else {
      _showMessage('ログイン失敗');
    }
  }

  // ユーザー登録
  void _signUp() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // ユーザー情報の保存や検証（ダミーデータを使用）
    _showMessage('ユーザー登録成功');
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('メッセージ'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                if (message == 'ログイン成功') {
                  // Navigate to the next page on successful login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Replace NextPage() with the actual page you want to navigate to
                  );
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('認証'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'メールアドレス'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _signIn,
                child: Text('ログイン'),
              ),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('ユーザー登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
