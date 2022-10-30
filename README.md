<p align="center">
  <a href="https://github.com/josephyaduvanshi" target="_blank">
    <img src="https://i.imgur.com/FvGE01Q.png"  width="1200" alt="RandomX">
  </a>
</p>

[![RandomX](https://img.shields.io/badge/random_x-firm-orange)](https://github.com/josephyaduvanshi/random_x)
[![Pub release](https://img.shields.io/pub/v/random_x.svg?style=flat-square)](https://pub.dev/packages/random_x)
[![GitHub Release Date](https://img.shields.io/github/release-date/josephyaduvanshi/random_x.svg?style=flat-square)](https://github.com/josephyaduvanshi/random_x)
[![GitHub issues](https://img.shields.io/github/issues/josephyaduvanshi/random_x.svg?style=flat-square)](https://github.com/josephyaduvanshi/random_x/issues)
[![GitHub top language](https://img.shields.io/github/languages/top/josephyaduvanshi/random_x.svg?style=flat-square)](https://github.com/josephyaduvanshi/random_x)
[![Likes](https://badges.bar/random_x/likes)](https://pub.dev/packages/random_x/score)
[![Popularity](https://badges.bar/random_x/popularity)](https://pub.dev/packages/random_x/score)
[![GitHub license](https://img.shields.io/badge/license-APACHE-blue.svg?style=flat)](https://github.com/josephyaduvanshi/random_x/blob/main/LICENSE)
[![support](https://img.shields.io/badge/platform-flutter%7Cflutter%20web%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/josephyaduvanshi/random_x)

### Show some :heart: and star the repo :star: :star:.

[![GitHub followers](https://img.shields.io/github/followers/josephyaduvanshi.svg?style=social&label=Follow)](https://github.com/josephyaduvanshi/)
[![Twitter Follow](https://img.shields.io/twitter/follow/Josefyaduvanshi.svg?style=social)](https://twitter.com/Josefyaduvanshi)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/Apache-2.0)

---

[**random_x**](https://pub.dev/packages/random_x) is a 100% free Dart open-source minimalist Library built with <a href="https://dart.dev/" target="_blank">Dart SDK</a> to make Flutter development easier and more joyful than ever.

```dart
Text("RandomX The Library For All Of Your Random Needs"),
```

---

# Table of contents

- [Getting Started](#getting-started)
- [Example App](#example-app)
- [Usage](#usage)
- [Why use random_x?](#why-use-random_x?)
- [RandomX Features](#randomx-features)
  - [Complete User Details](#complete-user-details)
  - [Random String](#random-string)
  - [Random Credit Cards](#random-credit-cards)
  - [Random UUID](#random-uuid)
  - [Random Name](#random-name)
  - [Random Addresses](#random-Addresses)
  - [Random UserAgent](#random-useragent)
  - **And There is a whole lot Much More to explore....**
- [Contributing](#contributing)
- [Project Created And Maintained By)(#project-created-and-maintained-by)
- [Donate](#donate)
- [Active Contributors](#active-contributors)
- [Copyright-and-license](#copyright-and-license)

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  random_x: <latest_version>
```

In your library add the following import:

```dart
import 'package:random_x/random_x.dart';
```

---

## [Example App](https://randomx-b7939.web.app/#/)

You can easily check our few features by accessing our [Example App](https://randomx-b7939.web.app/#/)


## Usage

`Random_X` is a _Random Library_ For all of your random needs for your projects that you'll ever need(possibly).
Include it in your `build` method like:

```dart
Text(RndX.generateName()),
Text(RndX.randomSSN(withdashes: true)),
```

It also offers several configurable parameters in a variety of functions, which you can utilize and tailor to your needs.
If you don't want the customization, I've given default values for each functions.

---

## Why use random_x?

random_x is known for :

| RandomX                                                                 | RandomX                                  |
| :---------------------------------------------------------------------- | :--------------------------------------- |
| Absolute top-notch in terms of the speed, efficiency, and compatibility | 100% free & open-source                  |
| 101% ready for production                                               | One library for all of your random needs |

---

<a href="https://www.buymeacoffee.com/josefyaduvanshi"><img src="https://storiesfrompalestine.info/wp-content/uploads/2020/09/BuyMeACoffee_blue@2x.png"  width="650" align="center" alt="RandomX"></a>

---

## RandomX Features

There are lots and lots of features included in the library which is practically messy to explain all here but I will try to give you an glimpse of some of an amazing features of the **Package**.

## Complete User Details

<img src="https://github.com/josephyaduvanshi/images/blob/main/Screen%20Recording%202022-10-31%20at%2012.16.42%20AM%20(1).gif?raw=true" align = "right" height = "300px">

```dart
Row(children:[
   Text(RndX.randomCompletePersonDetails().name),
   Text(RndX.randomCompletePersonDetails().gender),
   Text(RndX.randomCompletePersonDetails().race),
   Text(RndX.randomCompletePersonDetails().religion),
   Text(RndX.randomCompletePersonDetails().birthDay),
   ++ many more....
],)
```

## Random Strings

```dart
Text(RndX.randomString(type: RandomCharStringType.alphaNumerical, length: 10)),
The parameters are type and Length which you can easily customize as per your needs.
```

## Random Credit Cards

```dart
Row(
      children: [
        Text(RndX.randomFullCreditCard().ccn),
        Text(RndX.randomFullCreditCard().expiryDate),
        Text(RndX.randomFullCreditCard().cvv),
        Text(RndX.randomFullCreditCard().cardType),

      ],
    )
```

## Random UUID

```dart
   Text(RndX.genUUID()),
```
It generated version 4 of UUID with very subtle algoritm.


## Random Name

```dart
Text(RndX.generateName()),
```

## Random Addresses

```dart
 Row(
      children: [
        Text(RndX.randomAddress().address1),
        Text(RndX.randomAddress().address2),
        Text(RndX.randomAddress().city),
        Text(RndX.randomAddress().postalCode),
        Text(RndX.randomAddress().state),
        Text(RndX.randomAddress().coordinates.lat.toString()),
        Text(RndX.randomAddress().coordinates.lng.toString()),
      ],
    );
```

You can get random USA addresses using randomAddress function and then using the same instance to access the other instances of addresses.


## Random UserAgent

```dart
Row(
      children: [
        Text(RndX.getRandomUA()),
        Text(RndX.getRandomUA(count: 4, type: UserAgentType.macOs), ),
        Text(RndX.getRandomUA(count: 4, type: UserAgentType.mobile), ),
      ],
    );
```
You can easily generate random UA with custom configuration as well as shown above, there are few more parameters more there you can explore yourselves.

---

## Contributing

random_x is **100% free** and **open source**. We encourage and endorse an engaged, strong community that accepts contributions from the general public&ndash; which includes you. You may contribute to the expanding community of `random_x`.

- Pick up any issue marked with ["good first issue"](https://github.com/josephyaduvanshi/random_x/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)
- Fix a bug
- Write and somewhat enhance **documentation**. Documentation is really important to us. We would welcome assistance translating our documents into multiple languages.
- If you are a developer, feel free to check out the source and submit pull requests.
- Please don't forget to **like**, **follow**, and **star our repo**!

### :heart: Found this project useful?

If you considered this project useful, please consider giving it a :star: on Github, sharing it on social media, and giving it a like on PUB.dev.

---

## Project Created And Maintained By

### Joseph Yaduvanshi

**TECH ENTHUSIAST || APP DEVELOPMENT ❤️ || eatSleepCode — repeat👨🏻‍💻 | Okay BYEE!**

<a href="https://josefyaduvanshi.medium.com/"><img src="https://img.icons8.com/color-glass/96/000000/medium-monogram.png" width="60"></a>
<a href="https://twitter.com/josefyaduvanshi"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a>
<a href="https://in.linkedin.com/in/joseph-yaduvanshi-75250a233"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>

# Donate

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - [Bitcoin Address] 1JDas41DHqkfZb6VmXRndpQqUxNTTL6TFw

## Active Contributors

 - **[Joseph Yaduvanshi](https://github.com/josephyaduvanshi)**

**Any new Contributors are welcomed.**

## Copyright-and-license

Code and documentation Copyright 2022 [Joseph Yaduvanshi](https://github.com/josephyaduvanshi). Code released under the [Apache License](./LICENSE). Docs released under [Creative Commons](https://creativecommons.org/licenses/by/3.0/).
