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

import 'package:example/utils/custom_button.dart';
import 'package:example/utils/custom_template.dart';
import 'package:flutter/material.dart';
import 'package:random_x/random_x.dart';

class NextExamplesPageRandomX extends StatefulWidget {
  const NextExamplesPageRandomX({Key? key}) : super(key: key);

  @override
  State<NextExamplesPageRandomX> createState() =>
      _NextExamplesPageRandomXState();
}

int _radioValue = 0;

class _NextExamplesPageRandomXState extends State<NextExamplesPageRandomX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Examples'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
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
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 8),
                        color: const Color(0xfff5f5f7),
                        child: Text(
                          RndX.randomString(
                            type: _radioValue == 1
                                ? RandomCharStringType.alphaNumerical
                                : _radioValue == 2
                                    ? RandomCharStringType.lowerCase
                                    : _radioValue == 3
                                        ? RandomCharStringType.upperCase
                                        : _radioValue == 4
                                            ? RandomCharStringType.upperLower
                                            : RandomCharStringType
                                                .specialCharASCII,
                            length: 10,
                          ),
                          textScaleFactor: 1.25,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    RadioListTile(
                      title: const Text('AlphaNumerical'),
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('LoweCase'),
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('UpperCase'),
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('UpperLower'),
                      value: 4,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Special Char'),
                      value: 5,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Divider(),
                    ),
                    CustomButtonWithSplash(
                                   colorLightMode: RndX.randomPrimaryColor,
                      height: 30,
                      onTap: () {
                        setState(() {});
                      },
                      title: "Generate Random String",
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.genIMEINumber(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate IMEI",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.genUUID(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate UUID",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.firebaseRandomDocumentID(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Firebase Document ID",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.generateRandomIPV4(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random IPV4",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.generateRandomIPV6(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random IPV6",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.generateRandomMAC(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random MAC",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.guid(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate GUID",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomGoogleAPIKey(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Google API Key",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomHMACHash(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate HMAC Hash",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomMD5hashV1(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate MD5 Hash",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomVerifcationCodes(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Verification Code",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.getRandomUA(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random User Agent",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.generateUsername(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random Username",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.generateName(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random Name",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomWebsite(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random Website",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomSSN(withdashes: true),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random SSN",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomFavoriteMovie(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random Movie",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomDeviceDetail(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Random Device",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomFutureDate().toString(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Future Date",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomPastDate().toString(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Past Date",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.generateRandomCity(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate City",
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return CustomTemplate(
              title: RndX.randomSalary(),
              onPressed: () {
                setState(() {});
              },
              buttonTitle: "Generate Salary",
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: Colors.black,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                padding: const EdgeInsets.all(8),
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
                child: const Text(
                  "And Many More amazing ..... Features yet to be discovered. You can discover it yourself.\nPlus, We're always adding more features.",
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
