import 'dart:math';

/// A string that is used to generate random words.
String alphabetString =
    "ConsideringhowcommonillnessishowtremendousthespiritualchangethatitbringshowastonishingwhenthelightsofhealthgodowntheundiscoveredcountriesthatarethendisclosedwhatwastesanddesertsofthesoulaslightattackofinfluenzabringstolightwhatprecipicesandlawnssprinkledwithbrightflowersalittleriseoftemperaturerevealswhatancientandobdurateoaksareuprootedinusintheactofsicknesshowwegodownintothepitofdeathandfeelthewatersofannihilationcloseaboveourheadsandwakethinkingtofindourselvesinthepresenceoftheangelsandtheharperswhenwehaveatoothoutandcometothesurfaceinthedentistsarmchairandconfusehisRinsethemouth—rinsethemouthwiththegreetingoftheDeitystoopingfromthefloorofHeaventowelcomeus—whenwethinkofthisandinfinitelymoreaswearesofrequentlyforcedtothinkofititbecomesstrangeindeedthatillnesshasnottakenitsplacewithlovebattleandjealousyamongtheprimethemesofliteratureButthentheyweremarriedshefeltawfulaboutbeingpregnantbeforebutHarryhadbeentalkingaboutmarriageforawhileandanywaylaughedwhenshetoldhiminearlyFebruaryaboutmissingherperiodandsaidGreatshewasterriblyfrightenedandhesaidGreatandliftedherputhisarmsaroundunderherbottomandliftedherlikeyouwouldachildhecouldbesowonderfulwhenyoudidntexpectitinawayitseemedimportantthatyoudidntexpectittherewassomuchniceinhimshecouldntexplaintoanybodyshehadbeensofrightenedaboutbeingpregnantandhemadeherbeproudtheyweremarriedafterhermissinghersecondperiodinMarchandshewasstilllittleclumsydarkcomplectedJaniceSpringerandherhusbandwasaconceitedlunkwhowasntgoodforanythingintheworldDaddysaidandthefeelingofbeingalonewouldmeltalittlewithalittledrinkJustexactlylikeFatherifFatherhadknownasmuchaboutitthenightbeforeIwentoutthereashedidthedayafterIcamebackthinkingMadimpotentoldmanwhorealizedatlastthattheremustbesomelimiteventothecapabilitiesofademonfordoingharmwhomusthaveseenhissituationasthatoftheshowgirltheponywhorealizesthattheprincipaltunesheprancestocomesnotfromhornandfiddleanddrumbutfromaclockandcalendarmusthaveseenhimselfastheoldwornoutcannonwhichrealizesthatitcandeliverjustonemorefierceshotandcrumbletodustinitsownfuriousblastandrecoilwholookedaboutuponthescenewhichwasstillwithinhisscopeandcompassandsawsongonevanishedmoreinsuperabletohimnowthanifthesonweredeadsincenowifthesonstilllivedhisnamewouldbedifferent";

/// Generates a random word of a random length.
///
/// Args:
///   maxWordSize (int): The maximum size of the word to be generated.
///   constantWordSize (bool): If true, the word size will be the same for every word. Defaults to false
///
/// Returns:
///   A random word of length n, where n is a random number between 0 and maxWordSize.
String generateRandomPsuedoWord_({
  required int maxWordSize,
  bool constantWordSize = false,
}) {
  String randomWord = "";

  if (maxWordSize < 1) {
    throw Exception("Invalid maxWordSize");
  }

  if (constantWordSize) {
    for (int i = 0; i < maxWordSize; i++) {
      int index = Random().nextInt(alphabetString.length - 1);
      randomWord += alphabetString[index];
    }
  } else {
    int n = Random().nextInt(maxWordSize);
    for (int i = 0; i < n; i++) {
      int index = Random().nextInt(alphabetString.length - 1);
      randomWord += alphabetString[index];
    }
  }

  return randomWord;
}

/// Generate a list of random psuedo words of a given size
///
/// Args:
///   numOfWords (int): The number of words you want to generate.
///   maxWordSize (int): The maximum size of the word.
///   constantWordSize (bool): If true, all words will be the same length. Defaults to false
///
/// Returns:
///   A list of strings.
List<String> generateRandomPsuedoWordList_(
    {required int numOfWords,
    required int maxWordSize,
    bool constantWordSize = false}) {
  List<String> randomWordList = [];

  if (numOfWords < 1 || maxWordSize < 1) {
    throw Exception("Invalid numOfWords or maxWordSize");
  }

  for (int i = 0; i < numOfWords; i++) {
    randomWordList.add(generateRandomPsuedoWord_(
        maxWordSize: maxWordSize, constantWordSize: false));
  }

  return randomWordList;
}
