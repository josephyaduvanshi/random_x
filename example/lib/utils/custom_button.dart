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

class CustomButtonWithSplash extends StatelessWidget {
  final void Function()? onTap;
  final double? borderRadius;
  final double? textPx;
  final double? textPy;
  final double? px;
  final double? py;
  final double? textPOnlyTop;
  final double? textPOnlyBottom;
  final double? textPOnlyLeft;
  final double? textPOnlyRight;
  final double? textPxRow;
  final String title;
  final double? textScale;
  final Color? splashColor;
  final double? height;
  final Color? colorDarkMode;
  final Color? colorLightMode;
  final Color? textColor;
  const CustomButtonWithSplash({
    Key? key,
    required this.onTap,
    this.textPx,
    this.textPy,
    this.textPOnlyTop,
    this.textPOnlyBottom,
    this.textPOnlyLeft,
    this.textPOnlyRight,
    this.textPxRow,
    this.px,
    this.py,
    this.borderRadius,
    required this.title,
    this.textScale,
    this.splashColor,
    this.height,
    this.colorDarkMode,
    this.colorLightMode,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: px ?? 12.0, vertical: py ?? 8.0),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        child: InkWell(
          splashColor: splashColor ?? Colors.redAccent,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          onTap: onTap,
          child: Ink(
            height: height ?? 35,
            decoration: BoxDecoration(
              color: colorLightMode ?? Colors.blue,
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: textPx ?? 4.0, vertical: textPy ?? 0),
                    child: Text(title,
                        textAlign: TextAlign.center,
                        textScaleFactor: textScale ?? 1.25,
                        style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // .centered().px(px ?? 12).py(py ?? 8);
  }
}
