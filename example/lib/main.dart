/*
 * Copyright 2022 Joseph Yaduvanshi. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * This file is part of the Random_X library.
 * The RandomX library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY.
 *  * Author: Joseph Yaduvanshi
 */

import 'package:example/routes/routes.dart';
import 'package:example/utils/custom_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_x/random_x.dart';

import 'firebase_options.dart';
import 'pages/next_examples.dart';
import 'utils/avatar_widget.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RandomXExampleApp());
}

/// `RandomXExampleApp` is a `StatelessWidget` that returns a `MaterialApp` with a `ThemeData.light`
/// theme and a single route, `Routes.homeRoute`, that returns a `HomePage` widget
class RandomXExampleApp extends StatelessWidget {
  const RandomXExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      routes: {
        Routes.homeRoute: (context) => const HomePage(),
        Routes.nextExamples: (context) => const NextExamplesPageRandomX(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

ScrollController _scrollController = ScrollController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RandomX Example'),
      ),
      body: CupertinoScrollbar(
        thickness: 6,
        thumbVisibility: true,
        thicknessWhileDragging: 10,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: Card(
                shadowColor: Colors.black,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(
                          10.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 220, 214, 214),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Text(
                      "RandomX Example",
                      textScaleFactor: 1.3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 10),
              child: Avatar(
                url: RndX.getRandomAvatarUrl(
                  defaultImage: GravatarImage.retro,
                ),
              ),
            ),

            /// Creating a button with a splash effect.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomButtonWithSplash(
                colorLightMode: RndX.randomPrimaryColor,
                  height: 30,
                  onTap: () {
                    setState(() {
                      debugPrint("Generate Random");
                    });
                  },
                  title: 'Generate RandomX'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.black,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(
                          10.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 220, 214, 214),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text("Name"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().name),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Gender"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().gender),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Race"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().race),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Religion"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().religion),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Birthday"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().birthDay),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Zodiac Sign"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().zodiacSign),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Email"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().email),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Street Address"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .streetAddress),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("City"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().city),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("State"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().state),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Country"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().country),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Postal Code"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().postalCode),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Phone Number"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().phoneNumber),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("SSN Number"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails().ssn),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Height"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().height),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Weight"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().weight),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Hair Color"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().hairColor),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Eye Color"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().eyeColor),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Blood Group"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().bloodType),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Civil Status"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().civilStatus),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Educational Background"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .educationalBackground),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Disease History"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .diseaseHistory),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Employment Status"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .employmentStatus),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Monthly Salary"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .monthlySalary),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Occupation"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().occupation),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Vehicle"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().vehicle),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Hobbies"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().hobbies),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Color"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteColor),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Food"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteFood),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Music"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteMusic),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Movie"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteMovie),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Book"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteBook),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Sports"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteSports),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Favorite Genre"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .favoriteGenre),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Credit Card Number"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .creditCardNumber),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Credit Card Type"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .creditCardType),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Credit Card Expiry"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .creditCardExpirationDate),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Credit Card CVV"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(RndX.randomCompletePersonDetails()
                                .creditCardCVV),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Username"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().username),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Password"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().password),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Website"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().website),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Device"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                Text(RndX.randomCompletePersonDetails().device),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("IP Address"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().ipAddress),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("MAC Address"),
                          )),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                RndX.randomCompletePersonDetails().macAddress),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextButton(
                        onPressed: () async {
                          await Navigator.pushNamed(
                            context,
                            Routes.nextExamples,
                          );
                        },
                        child: const Text(
                          "Click Here To Check Other Examples =>",
                          textScaleFactor: 1.16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
* I know we can optimize this code alot by creating separate widgets 
* and using them in the main widget but 
* I just wanted to show you how to use the package in a simple way.
* After all it's just an example.
*/
