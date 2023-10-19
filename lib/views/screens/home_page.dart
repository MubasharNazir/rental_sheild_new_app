import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rental_sheild_new_app/views/screens/containres_list.dart';
import 'package:rental_sheild_new_app/views/screens/gridview_container.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                  height: 35,
                  width: 35,
                  child: Image(image: AssetImage('assets/images/menu.png'))),
              SizedBox(
                width: 50,
              ),
              SizedBox(
                  height: 30,
                  width: 180,
                  child: Image(image: AssetImage('assets/images/logo.png'))),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height * 0.23,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: containers.length,
                        controller: PageController(
                          initialPage: currentPage,
                          viewportFraction: 1,
                        ),
                        onPageChanged: (int page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: containers[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: containers.map((container) {
                        int index = containers.indexOf(container);
                        return Container(
                          width: 15.0,
                          height: 15.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage == index
                                ? Colors.grey
                                : const Color.fromARGB(207, 255, 244,
                                    244), // Change color based on current page
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    Text(
                      'Show All',
                      style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Adjust as needed
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/move_in.png',
                          width: 90, height: 60),
                      const Text('Move-In',
                          style: TextStyle(fontFamily: 'Poppins')),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/contract.png',
                          width: 90, height: 60),
                      const Text(
                        'Contact',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/deposit.png',
                          width: 90, height: 60),
                      const Text('Deposit',
                          style: TextStyle(fontFamily: 'Poppins')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: height * 0.44,
                width: double.infinity,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: const [
                    MyContainer(
                      index: 0,
                      imagePath: 'assets/images/maintenance.jpg',
                      text: 'Maintenance',
                    ),
                    MyContainer(
                      index: 1,
                      imagePath: 'assets/images/manage_profile.png',
                      text: 'Manage Profile',
                    ),
                    MyContainer(
                      index: 2,
                      imagePath: 'assets/images/question.jpg',
                      text: 'Questions',
                    ),
                    MyContainer(
                      index: 3,
                      imagePath: 'assets/images/properties.png',
                      text: 'Properties',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
                width: 150,
                child: Divider(
                  thickness: 4,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Want to know more?visit ',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Poppins'),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'www.rentalsheild.ai',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch(
                                'https://www.google.com/search?q=w3schools&sca_esv=573727491&rlz=1C1CHBF_enPK1037PK1037&sxsrf=AM9HkKn0nVaWfeNZtcI-pyFItLlmWsXykg%3A1697444537526&ei=ufIsZcLdH4ankdUPtJ2M2A8&ved=0ahUKEwiCnr3VkfqBAxWGU6QEHbQOA_sQ4dUDCBA&oq=w3schools&gs_lp=Egxnd3Mtd2l6LXNlcnAiCXczc2Nob29sczIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYRxjWBBiwAzIKEAAYigUYsAMYQzIWEC4YigUYxwEY0QMYyAMYsAMYQ9gBATIWEC4YigUYxwEY0QMYyAMYsAMYQ9gBATIWEC4YigUYxwEY0QMYyAMYsAMYQ9gBAUjlIVAAWABwAngBkAEAmAEAoAEAqgEAuAEMyAEA4gMEGAAgQYgGAZAGDLoGBAgBGAg&sclient=gws-wiz-serp');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Your information is safe and \n secure with Rental Sheild',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins'),
              ),
              const SizedBox(height: 30),
              const Center(
                  child: Column(children: [
                Text('We are an ADGM_licensed company',
                    style: TextStyle(fontSize: 18, fontFamily: 'poppins')),
                Text('under the registration number ',
                    style: TextStyle(fontSize: 18, fontFamily: 'poppins')),
                Text('000003739.For more information',
                    style: TextStyle(fontSize: 18, fontFamily: 'poppins')),
                Text('please visit adgm.com',
                    style: TextStyle(fontSize: 18, fontFamily: 'poppins'))
              ])),
              const SizedBox(height: 30),
              const Center(
                  child: Image(image: AssetImage('assets/images/rgdm.png')))
            ],
          ),
        ),
      ),
    );
  }
}
