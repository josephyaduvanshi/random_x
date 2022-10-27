import 'dart:math';

String alphabetString =
    "ConsideringhowcommonillnessishowtremendousthespiritualchangethatitbringshowastonishingwhenthelightsofhealthgodowntheundiscoveredcountriesthatarethendisclosedwhatwastesanddesertsofthesoulaslightattackofinfluenzabringstolightwhatprecipicesandlawnssprinkledwithbrightflowersalittleriseoftemperaturerevealswhatancientandobdurateoaksareuprootedinusintheactofsicknesshowwegodownintothepitofdeathandfeelthewatersofannihilationcloseaboveourheadsandwakethinkingtofindourselvesinthepresenceoftheangelsandtheharperswhenwehaveatoothoutandcometothesurfaceinthedentistsarmchairandconfusehisRinsethemouth—rinsethemouthwiththegreetingoftheDeitystoopingfromthefloorofHeaventowelcomeus—whenwethinkofthisandinfinitelymoreaswearesofrequentlyforcedtothinkofititbecomesstrangeindeedthatillnesshasnottakenitsplacewithlovebattleandjealousyamongtheprimethemesofliteratureButthentheyweremarriedshefeltawfulaboutbeingpregnantbeforebutHarryhadbeentalkingaboutmarriageforawhileandanywaylaughedwhenshetoldhiminearlyFebruaryaboutmissingherperiodandsaidGreatshewasterriblyfrightenedandhesaidGreatandliftedherputhisarmsaroundunderherbottomandliftedherlikeyouwouldachildhecouldbesowonderfulwhenyoudidntexpectitinawayitseemedimportantthatyoudidntexpectittherewassomuchniceinhimshecouldntexplaintoanybodyshehadbeensofrightenedaboutbeingpregnantandhemadeherbeproudtheyweremarriedafterhermissinghersecondperiodinMarchandshewasstilllittleclumsydark-complectedJaniceSpringerandherhusbandwasaconceitedlunkwhowasntgoodforanythingintheworldDaddysaidandthefeelingofbeingalonewouldmeltalittlewithalittledrinkJustexactlylikeFatherifFatherhadknownasmuchaboutitthenightbeforeIwentoutthereashedidthedayafterIcamebackthinkingMadimpotentoldmanwhorealizedatlastthattheremustbesomelimiteventothecapabilitiesofademonfordoingharmwhomusthaveseenhissituationasthatoftheshowgirltheponywhorealizesthattheprincipaltunesheprancestocomesnotfromhornandfiddleanddrumbutfromaclockandcalendarmusthaveseenhimselfastheoldwornoutcannonwhichrealizesthatitcandeliverjustonemorefierceshotandcrumbletodustinitsownfuriousblastandrecoilwholookedaboutuponthescenewhichwasstillwithinhisscopeandcompassandsawsongonevanishedmoreinsuperabletohimnowthanifthesonweredeadsincenowifthesonstilllivedhisnamewouldbedifferent";

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

List<String> generateRandomPsuedoWordList_(
    {required int numOfWords,
    required int maxWordSize,
    bool constantWordSize = false}) {
  List<String> randomWordList = [];

  if (numOfWords < 1 || maxWordSize < 1) {
    throw Exception("Invalid numOfWords");
  }

  for (int i = 0; i < numOfWords; i++) {
    randomWordList.add(generateRandomPsuedoWord_(
        maxWordSize: maxWordSize, constantWordSize: false));
  }

  return randomWordList;
}

