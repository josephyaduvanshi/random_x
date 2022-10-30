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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? url;

  const Avatar({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return const Text("ERROR: URL is null");
    }
    return Hero(
      tag: 'Avatar Image',
      child: CircleAvatar(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.blue,
        radius: 55.0,
        child: ClipOval(
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 1000),
            fadeInCurve: Curves.bounceInOut,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: url!,
            fit: BoxFit.cover,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
