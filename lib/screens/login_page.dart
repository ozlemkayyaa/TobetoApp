import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Arka plan resmi
          Image.asset(
            'assets/images/highResCover.png',
            fit: BoxFit.fill,
          ),

          // Login formu
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 40.0,
            right: 40.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/tobeto.jpg'),
                    //Row(
                    //children: [
                    //const Icon(Icons.person),
                    //const SizedBox(width: 8.0),
                    OutlinedButton(
                      onPressed: () {},
                      child: TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Kullanıcı Kodu',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    //],
                    //),
                    const SizedBox(height: 16.0),
                    OutlinedButton(
                      onPressed: () {},
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'Parola'),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: double.infinity,
                      child: loginButtonMethod(),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Parolamı Unuttum",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton loginButtonMethod() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.deepPurple, // Buton rengini burada belirleyebilirsiniz
      ),
      onPressed: () {
        // Kullanıcı adı ve şifre kontrolü
        if (_usernameController.text == 'kullanici' &&
            _passwordController.text == 'sifre') {
          // Giriş başarılı
          _showDialog('Başarılı', 'Giriş başarıyla gerçekleşti.');
        } else {
          // Giriş başarısız
          _showDialog('Başarısız', 'Kullanıcı adı veya şifre hatalı.');
        }
      },
      child: const Text('Giriş Yap', style: TextStyle(color: Colors.white)),
    );
  }

  // Basit bir dialog gösterme metodu
  Future<void> _showDialog(String title, String content) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
