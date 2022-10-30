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

import 'package:flutter/material.dart';

import 'package:example/utils/custom_button.dart';
import 'package:random_x/random_x.dart';

class CustomTemplate extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final void Function() onPressed;
  const CustomTemplate({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.black,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  color: const Color(0xfff5f5f7),
                  child: Text(
                    title,
                    textScaleFactor: 1.25,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Divider(),
              ),
              CustomButtonWithSplash(
                colorLightMode: RndX.randomPrimaryColor,
                height: 30,
                onTap: onPressed,
                title: buttonTitle,
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
