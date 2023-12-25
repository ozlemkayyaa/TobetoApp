import 'package:flutter/material.dart';
import 'package:tobeto/constants/text_const.dart';
import 'package:tobeto/screens/login/login_screen.dart';
import 'package:tobeto/widget/drawer_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  bool _showPassword = true;
  bool _showPasswordAgain = true;

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      // Giriş başarılı Snackbar'ını göster
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Giriş Başarılı'),
        backgroundColor: Colors.green.shade500,
      ));

      // Kullanıcıyı HomeScreen sayfasına yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(isDarkMode ? darkLogoImage : lightLogoImage,
              fit: BoxFit.contain, height: 32),
        ]),
      ),
      endDrawer: const DrawerWidget(isDarkMode: false),
      body: Card(
        semanticContainer: true,
        surfaceTintColor: isDarkMode ? Colors.black : Colors.white,
        margin: const EdgeInsets.all(5),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        color: isDarkMode ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Login formun üstündeki TOBETO LOGOSU
                          Center(
                            child: Image.asset(
                                isDarkMode ? darkLogoImage : lightLogoImage,
                                width: 200),
                          ),

                          SizedBox(height: size.height * 0.05),
                          const Text(
                            signUp,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),

                          // İsim Kutusu
                          SizedBox(height: size.height * 0.04),
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              return validatorSignUpMethod(value);
                            },
                            decoration: InputDecoration(
                              hintText: name,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          // Soyad Kutusu
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: surnameController,
                            decoration: InputDecoration(
                              hintText: surname,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              return validatorSignUpMethod(value);
                            },
                          ),

                          // E-Posta girilen kutucuk
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: email,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              return validatorSignUpMethod(value);
                            },
                          ),

                          // Şifre kutucuğu
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            obscureText: _showPassword,
                            controller: passwordController,
                            validator: (value) {
                              return validatorSignUpMethod(value);
                            },

                            // Şifrenin gözükmesi ve gözükmemesi işlevi
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () => _showPassword
                                        ? _showPassword = false
                                        : _showPassword = true,
                                  );
                                },
                                icon: _showPassword
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                              ),
                              hintText: password,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          // Şifre Tekrar kutucuğu
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            obscureText: _showPasswordAgain,
                            controller: passwordAgainController,
                            validator: (value) {
                              return validatorSignUpMethod(value);
                            },

                            // Şifrenin gözükmesi ve gözükmemesi işlevi
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () => _showPasswordAgain
                                        ? _showPasswordAgain = false
                                        : _showPasswordAgain = true,
                                  );
                                },
                                icon: _showPasswordAgain
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                              ),
                              hintText: passwordAgain,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          // Kayıt Ol Butonu
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Giriş Yap butonu - login fonksiyonu sayesinde, Başarılı giriş yazısının gözükmesi
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    register();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          240, 153, 51, 255),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15)),
                                  child: const Text(
                                    registerButton,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(account),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                                child: const Text(
                                  loginButton,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validatorSignUpMethod(String? value) {
    if (value == null || value.isEmpty) {
      return "Bu alan boş bırakılamaz";
    }
    return null;
  }
}
