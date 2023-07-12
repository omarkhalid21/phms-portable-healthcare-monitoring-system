import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'akzmw80b': {
      'en': 'Doctor',
      'ar': 'دكتور',
    },
    'aeacb0zd': {
      'en': 'tutorial video ',
      'ar': 'فيديوهات تدريب عن البرنامج',
    },
    'ub2mcfb5': {
      'en': 'patient',
      'ar': 'المريض',
    },
    'yhuhtp6d': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Doctor_Login
  {
    'ptn34e49': {
      'en': 'Welcome',
      'ar': 'مرحباً',
    },
    '0ex18yc0': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
    },
    'pa5lotb1': {
      'en': 'Enter your Email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '0y95w5pu': {
      'en': 'Enter your Password',
      'ar': 'ادخل رقمك السري',
    },
    'jgig1vi2': {
      'en': 'Doctor login',
      'ar': ' تسجيل دخول الدكتور',
    },
    '7vlwr2uo': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // ContactPatient
  {
    'co2nb9fa': {
      'en': 'Tap on the button to call The Patient',
      'ar': 'اضغط على الزر للاتصال بالمريض',
    },
    '2s7t647z': {
      'en': 'Tap on the button to send mail The Patient',
      'ar': 'اضغط على الزر لإرسال بريد المريض',
    },
    '7rwy1iy8': {
      'en': 'Call',
      'ar': 'يتصل',
    },
    '2itdbvor': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '3cfd3vkf': {
      'en': 'Contact Patient ',
      'ar': 'اتصل بالمريض',
    },
    'cvlxhgjv': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // meetinglist
  {
    'ia1avdrc': {
      'en':
          'If You Want A Meeting with User Click on A button to create Meeting ',
      'ar':
          'إذا كنت تريد اجتماعًا مع المستخدم ، فانقر فوق الزر  لإنشاء الاجتماع',
    },
    'plijexnp': {
      'en': 'Create Link ',
      'ar': 'إنشاء رابط',
    },
    'ystu22dt': {
      'en': 'Send the Link To Patient in A message ',
      'ar': 'أرسل الرابط إلى المريض في رسالة',
    },
    'efg6q4rw': {
      'en': 'Send Link ',
      'ar': 'أرسل الرابط',
    },
    'gz3bkmxj': {
      'en': 'Meeting List ',
      'ar': 'قائمة الاجتماعات',
    },
    'dawsdmqi': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // DoctorMapping
  {
    '6zahigis': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
    'qf693st4': {
      'en': 'Patient History',
      'ar': 'تاريخ المريض',
    },
    's48x8w5l': {
      'en': 'Metting List',
      'ar': 'قائمة التقاء',
    },
    'k1fd7ubq': {
      'en': 'Log in ',
      'ar': 'تسجيل الدخول',
    },
    '8j3yi2ur': {
      'en': 'Contact Patient',
      'ar': 'اتصل بالمريض',
    },
    'weomxlyo': {
      'en': 'Application Mqapping ',
      'ar': 'تعيين التطبيق',
    },
    'toyic2g3': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // DoctorMeasurements
  {
    'e3eyt8vo': {
      'en': 'Reauest data from patient ',
      'ar': 'طلب البيانات  المريض',
    },
    'mni92e2w': {
      'en': 'To check Measurements for from iot platform',
      'ar': 'للتحقق من القياسات',
    },
    'pqumvf7i': {
      'en': 'To request data history',
      'ar': 'لطلب السجل المرضي ',
    },
    'bpvski1y': {
      'en': 'explain how to check and get data history',
      'ar': 'شرح كيفية التحقق والحصول لي  سجل البيانات',
    },
    'i0g6wl1t': {
      'en': 'Firebase',
      'ar': 'علامات حيوية',
    },
    '6kztmu7s': {
      'en': 'Thingspeak',
      'ar': 'علامات حيوية',
    },
    '7ehfb82u': {
      'en': 'Measurements ',
      'ar': 'قياسات',
    },
    'dag83adl': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // PaientPage
  {
    'praio0t5': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
    },
    'k4tkpj94': {
      'en': 'Sign up ',
      'ar': 'انشاء حساب',
    },
    'ryyqoqk2': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Signup
  {
    '6vprgf1p': {
      'en': 'Welcome',
      'ar': 'مرحباً',
    },
    '69k07j5s': {
      'en': 'Enter your Name',
      'ar': 'أدخل أسمك',
    },
    'xigtahu4': {
      'en': 'sign in',
      'ar': 'تسجيل الدخول',
    },
    '7zzru6r4': {
      'en': 'Re Enter your Password',
      'ar': 'أعد إدخال كلمة المرور',
    },
    'jnwqnqgo': {
      'en': 'Enter your Password',
      'ar': 'ادخل رقمك السري',
    },
    '8sli4wyi': {
      'en': 'Enter your Email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'jwsvia3e': {
      'en': 'Renter your Email',
      'ar': 'استأجر بريدك الإلكتروني',
    },
    'w3r22j0a': {
      'en': 'Sign up',
      'ar': 'امشاء حساب',
    },
    'd1ysoheo': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Login
  {
    'yhhzmti5': {
      'en': 'Welcome',
      'ar': 'مرحباً',
    },
    '8ji8rh4u': {
      'en': 'Enter your Email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '20kbhvcz': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
    },
    'm9b5j5p5': {
      'en': 'Enter your Password',
      'ar': 'ادخل رقمك السري',
    },
    'tc5t9kkk': {
      'en': 'Log in ',
      'ar': 'تسجيل الدخول',
    },
    'r88676ll': {
      'en': 'Home',
      'ar': 'الصفحة الاساسية',
    },
  },
  // Datapage
  {
    '45s1h3hf': {
      'en': 'Enter your blood group',
      'ar': 'أدخل فصيله الدم الخاصة بك',
    },
    '3mmtkdth': {
      'en': 'Enter your Phone number',
      'ar': 'أدخل رقم هاتفك',
    },
    'q46h8kq8': {
      'en': 'Enter your Hight',
      'ar': 'أدخل طولك الخاص بك',
    },
    'k18y64xm': {
      'en': 'Enter your Name',
      'ar': 'أدخل أسمك',
    },
    'd25hfvuu': {
      'en': 'Submit',
      'ar': 'تسليم',
    },
    '8gumur07': {
      'en': 'Data ',
      'ar': 'بيانات',
    },
    'nw89j1ku': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Medcinet_tabele
  {
    'p2jybqdu': {
      'en': 'medicine  1 ',
      'ar': 'الطب 1',
    },
    'jtv7h1ri': {
      'en': 'medicine  2 ',
      'ar': 'الطب 2',
    },
    'sjx4h8ui': {
      'en': 'medicine  3 ',
      'ar': 'الطب 3',
    },
    'lw3bqb4b': {
      'en': 'Please select medicine  ',
      'ar': 'الرجاء تحديد دواء',
    },
    'v5ko8aq9': {
      'en': 'medicine Table',
      'ar': 'جدول الدواء',
    },
    'ltczmo83': {
      'en': 'Tap for time of medicine ',
      'ar': 'اضغط لظبط  وقت الدواء',
    },
    'rmrozyyr': {
      'en': 'Tap for timer ',
      'ar': 'انقر للحصول على المؤقت',
    },
    'elgectsn': {
      'en': 'medicine  1 ',
      'ar': 'دواء 1',
    },
    'i5gd1fm2': {
      'en': 'medicine  2 ',
      'ar': 'دواء 2',
    },
    'zlwz3byb': {
      'en': 'medicine  3 ',
      'ar': 'دواء 3',
    },
    'pqtrure8': {
      'en': 'Please select medicine  ',
      'ar': 'الرجاء تحديد دواء',
    },
    '83uh8nh0': {
      'en': 'Tap for time of medicine ',
      'ar': 'اضغط لمعرفة وقت الدواء',
    },
    'sb3zle4k': {
      'en': 'Tap for timer ',
      'ar': 'انقر للحصول على المؤقت',
    },
    '2hkbn1wu': {
      'en': 'medicine  1 ',
      'ar': 'دواء  1',
    },
    '50wisfxk': {
      'en': 'medicine  2 ',
      'ar': 'دواء  2',
    },
    'g19f03bp': {
      'en': 'medicine  3 ',
      'ar': 'دواء  3',
    },
    'lbyaozup': {
      'en': 'Please select medicine  ',
      'ar': 'الرجاء تحديد دواء',
    },
    'huv6hpwa': {
      'en': 'Tap for time of medicine ',
      'ar': 'اضغط لتحديد وقت الدواء',
    },
    'ff33oyjp': {
      'en': 'Tap for timer ',
      'ar': 'انقر لظبط على المؤقت',
    },
    'brfxjt15': {
      'en': 'Medicine',
      'ar': 'الدواء',
    },
    'geddgf17': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // exercises
  {
    '7cu8ozx9': {
      'en': 'Seated Exercises for Older Adults',
      'ar': 'تمارين الجلوس لكبار السن',
    },
    'qc0rli8j': {
      'en': 'Strengthening Exercises For The Elderly',
      'ar': 'تمارين تقوية لكبار السن',
    },
    'r3iofnni': {
      'en': 'Doing Exercises improve health',
      'ar': 'ممارسة التمارين تحسن الصحة',
    },
    'l0n0j9a6': {
      'en': 'exercises',
      'ar': 'تمارين',
    },
    '8pksmtsd': {
      'en': 'exercises',
      'ar': 'تمارين',
    },
  },
  // Support_page
  {
    'dndzmeli': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'olstj271': {
      'en': 'family person',
      'ar': 'فرد من العائلة',
    },
    'lag0tmvk': {
      'en': 'Doctor',
      'ar': 'طبيب',
    },
    '0tvvx4j8': {
      'en': 'Share Location',
      'ar': 'مشاركة الموقع',
    },
    'fepexfc0': {
      'en':
          '   if you havr any problem using the app, tap help this  let you send an automatic mail to us and we will contact with you shortly ',
      'ar':
          'إذا كان لديك أي مشكلة في استخدام التطبيق ، فانقر فوق مساعدة هذا\n   تتيح لك إرسال بريد تلقائي إلينا وسنقوم بذلك\n   اتصل بك قريبا',
    },
    '1yq2346y': {
      'en':
          '   if you have any  emergency case you want a doctor , tab emergency',
      'ar':
          'إذا كان لديك أي حالة طارئة تريد طبيبًا ،\n   علامة التبويب الطوارئ',
    },
    '07t81sxj': {
      'en': 'If you want send location ',
      'ar': 'إذا كنت تريد إرسال الموقع الجغرافي',
    },
    'g0tof4ad': {
      'en': 'Emergency',
      'ar': 'طارئ',
    },
    'lkj2z24y': {
      'en': 'Support',
      'ar': 'يدعم',
    },
    'fnzutlud': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Measurements
  {
    'gara3qt4': {
      'en': 'Reauest data',
      'ar': 'الحصول علي  البيانات',
    },
    '4crdvz4s': {
      'en': 'Firebase',
      'ar': 'علامات حيوية',
    },
    '7um2yjj3': {
      'en': 'To check Measurements',
      'ar': 'للتحقق من القياسات',
    },
    'pilpk7u1': {
      'en': 'To request data history',
      'ar': 'لطلب السجل المرضي ',
    },
    '2fmeykdc': {
      'en': 'Explain how to check and get data history',
      'ar': 'شرح كيفية التحقق والحصول على سجل البيانات',
    },
    'm3bfmhhb': {
      'en': 'Thingspeak',
      'ar': 'علامات حيوية',
    },
    'hqjmu4f1': {
      'en': 'Measurements ',
      'ar': 'قياسات',
    },
    'zcst91j7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // QR-code
  {
    '0mge45nx': {
      'en': 'In case you asked about you dataand api',
      'ar': 'في حالة السوال عن البيانات  امسح  الكود',
    },
    'vp6tzn3a': {
      'en': 'Cancel',
      'ar': '',
    },
    '3l68z76a': {
      'en': 'QR code',
      'ar': '  كود',
    },
    'fpucfj88': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // mapping
  {
    'lwv65l0e': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
    'gmrllgg5': {
      'en': 'Data',
      'ar': 'قاعدة بيانات',
    },
    'v1jvnzfx': {
      'en': 'vital signs',
      'ar': 'العلامات حيوية',
    },
    'yn16p1cx': {
      'en': 'Log in ',
      'ar': 'تسجيل الدخول',
    },
    'zcwjnms6': {
      'en': 'setting ',
      'ar': 'الاعدادات',
    },
    '47cpxo67': {
      'en': 'QR CODE',
      'ar': 'الكود رمزي',
    },
    'nrtksl2f': {
      'en': 'About us ',
      'ar': 'معلومات عنا',
    },
    'ckhkyuln': {
      'en': 'Medcine time ',
      'ar': 'وقت الدواء',
    },
    '1maoqqhw': {
      'en': 'Support ',
      'ar': 'الدعم',
    },
    'sf9uv9hi': {
      'en': 'exercises',
      'ar': 'تمارين',
    },
    'sxgqjejk': {
      'en': 'Application Mapping ',
      'ar': 'صفحات التطبيق',
    },
    '0i0vjxzt': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Setting
  {
    'ltzqsg9l': {
      'en': 'Log out ',
      'ar': 'تسجيل خروج',
    },
    'ygf6i6ol': {
      'en': 'Arabic',
      'ar': 'الغة العربية',
    },
    'rzqwenxu': {
      'en': 'White mode',
      'ar': ' الوضع المضيء',
    },
    'nsp6blmi': {
      'en': 'System mode',
      'ar': 'وضع النظام',
    },
    'sp3iu5ah': {
      'en': 'Dark mode',
      'ar': 'الوضع المظلم',
    },
    'i3won7d2': {
      'en': 'Account setting',
      'ar': 'اعدادات الحساب',
    },
    'nizrvjhx': {
      'en': 'Set the mode of  the application to \"ligth\"',
      'ar': 'اضبط وضع الاضاءة في التطبيق',
    },
    'u4mny30s': {
      'en': 'Delete user',
      'ar': 'مسح المستخدم',
    },
    'zo13z6sf': {
      'en': 'English',
      'ar': 'الغة الانجليزية',
    },
    '7wtsay27': {
      'en': 'Set the language of  the application',
      'ar': 'اضبط وضع الاضاءة في التطبيق',
    },
    'xnavi9db': {
      'en': 'About us ',
      'ar': 'معلومات عنا',
    },
    'jrbfg46h': {
      'en': 'Support',
      'ar': 'الدعم',
    },
    'xkvyvegr': {
      'en': 'Setting ',
      'ar': 'الاعدادات',
    },
    '8voxmu5r': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Howuseapp
  {
    'd08wqfq8': {
      'en': 'Home ',
      'ar': '',
    },
    'oi4scidt': {
      'en': 'Part 1',
      'ar': '',
    },
    'ij2zpxsa': {
      'en': 'Part 2',
      'ar': '',
    },
    'f5giad44': {
      'en': 'How Use App',
      'ar': 'تمارين',
    },
    'd906lryt': {
      'en': 'exercises',
      'ar': 'تمارين',
    },
  },
  // About
  {
    'bdplnky8': {
      'en':
          '   We would like to extend our sincerest gratitude to all of our                                \n   users of the remote patient monitoring application. Your trust i                                    \n   in our program has made all of the hard work and dedication                                \n   worth while. Our advisor has been a constant source of \n   guidance and support, and we are grateful for their \n   contributions. Our families have also been a source of love and \n  encouragement throughout this journey, and we cannot thank \n  them enough. Lastly, we would like to extend our gratitude to \n  our incredible team. Our co-operation and hard work have\n  been instrumental in achieving our goal, and we could not \n  have done it  without each and every one of you. Thank you all \n   for your support and belief in our vision.',
      'ar':
          'نودّ أن نعبر عن امتناننا الصادق لجميع مستخدمي تطبيق رصد المرضى عن بُعد. ثقتكم ببرنامجنا جعل كل الجهد والتفاني يستحقان العناء. كان مستشارنا مصدرًا دائمًا للإرشاد والدعم، ونحن ممتنون لمساهماتهم. عائلاتنا كانت أيضًا مصدرًا للحب والتشجيع طوال هذه الرحلة، ولا يمكننا شكرهم بما يكفي. وأخيرًا، نودّ أن نعبر عن شكرنا لفريقنا المذهل. كان التعاون والعمل الجاد من قبل الجميع أساسيًا في تحقيق هدفنا، ولم نكن قادرين على القيام بذلك دون كل واحد منكم. شكرًا لكم جميعًا على دعمكم وإيمانكم برؤيتنا.',
    },
    'zcvvpega': {
      'en': 'Thanking',
      'ar': 'شكرا',
    },
    '7g6fotkc': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '9puesj4o': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Robot
  {
    'ao7qwsj7': {
      'en': 'Left',
      'ar': '',
    },
    '2zvha835': {
      'en': 'Right',
      'ar': '',
    },
    't4oa2qfq': {
      'en': 'Down',
      'ar': '',
    },
    'd7tltxk9': {
      'en': 'Forward',
      'ar': '',
    },
    '9sbub3ls': {
      'en': 'medicine table',
      'ar': '',
    },
    '1edzcuze': {
      'en': 'Manual movement control',
      'ar': '',
    },
    '44w14a77': {
      'en': 'Turn in bluetooth ',
      'ar': '',
    },
    'q3vcwk4y': {
      'en': 'Automatic movement control',
      'ar': '',
    },
    'ihy43otc': {
      'en': 'medicine  1 ',
      'ar': 'دواء 1',
    },
    'mtnm8jy0': {
      'en': 'medicine  2 ',
      'ar': 'دواء 2',
    },
    'dwijrpf0': {
      'en': 'medicine  3 ',
      'ar': 'دواء 3',
    },
    'udaootdr': {
      'en': 'Please select medicine  ',
      'ar': 'الرجاء تحديد دواء',
    },
    'n6lffyf6': {
      'en': 'medicine  1 ',
      'ar': 'دواء 1',
    },
    'cad5fdbx': {
      'en': 'medicine  2 ',
      'ar': 'دواء 2',
    },
    '5rc8g13c': {
      'en': 'medicine  3 ',
      'ar': 'دواء 3',
    },
    'yzuaroz2': {
      'en': 'Please select medicine  ',
      'ar': 'الرجاء تحديد دواء',
    },
    'wgfztto2': {
      'en': 'medicine  1 ',
      'ar': 'دواء 1',
    },
    'r8g24a7b': {
      'en': 'medicine  2 ',
      'ar': 'دواء 2',
    },
    'hw7thcyg': {
      'en': 'medicine  3 ',
      'ar': 'دواء 3',
    },
    'nkd0v8vl': {
      'en': 'Please select medicine  ',
      'ar': 'الرجاء تحديد دواء',
    },
    'kipuba8y': {
      'en': 'Robot manager',
      'ar': 'تمارين',
    },
    '62kr78wg': {
      'en': 'exercises',
      'ar': 'تمارين',
    },
  },
  // chat
  {
    'j0h5u5ma': {
      'en': 'exercises',
      'ar': 'تمارين',
    },
  },
  // firebase
  {
    '2qavw1p7': {
      'en': 'firebase',
      'ar': '',
    },
    'za5i239s': {
      'en': 'Chat with me',
      'ar': '',
    },
    'a311ozb2': {
      'en': 'Generate a Key',
      'ar': '',
    },
    '56abaqlq': {
      'en': 'Call support',
      'ar': '',
    },
    'qbvr3muh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ThingSpeak
  {
    'owpn5emx': {
      'en': 'ThingSpeak',
      'ar': '',
    },
    'scw2352r': {
      'en': 'Chat with me',
      'ar': '',
    },
    '1kkm9q10': {
      'en': 'Generate a Key',
      'ar': '',
    },
    'zc5y713p': {
      'en': 'Call support',
      'ar': '',
    },
    '0ubjvxt1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // firebase_doctor
  {
    'bo57m51e': {
      'en': 'firebase',
      'ar': '',
    },
    'gilqy3d3': {
      'en': 'Chat with me',
      'ar': '',
    },
    'itpewf01': {
      'en': 'Generate a Key',
      'ar': '',
    },
    'ixfuhmiu': {
      'en': 'Call support',
      'ar': '',
    },
    '9dn47ed9': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ThingSpeak_docotor
  {
    'h8yi9qd2': {
      'en': 'Thingspeak',
      'ar': '',
    },
    'z7r8t6cq': {
      'en': 'Chat with me',
      'ar': '',
    },
    'fa8rkhq0': {
      'en': 'Generate a Key',
      'ar': '',
    },
    'fy2xlxfx': {
      'en': 'Call support',
      'ar': '',
    },
    'vlfxflci': {
      'en': 'Home',
      'ar': '',
    },
  },
  // robot_location
  {
    'kohelbxj': {
      'en': 'Robot location',
      'ar': '',
    },
    '93h3bu2e': {
      'en': 'Chat with me',
      'ar': '',
    },
    'f1xvmnkg': {
      'en': 'Generate a Key',
      'ar': '',
    },
    'jwut8sh0': {
      'en': 'Call support',
      'ar': '',
    },
    'fiuwtihs': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'el74vmuu': {
      'en': '',
      'ar': '',
    },
    'rnndk7iy': {
      'en': 'pls',
      'ar': '',
    },
    'b6xc78fo': {
      'en': 'pls',
      'ar': '',
    },
    'juaa0qkr': {
      'en': 'pls',
      'ar': '',
    },
    'cjlleit1': {
      'en': 'pls',
      'ar': '',
    },
    'ic3ryv8d': {
      'en': 'pls',
      'ar': '',
    },
    'lqkpzjoc': {
      'en': 'pls',
      'ar': '',
    },
    'eggfatgd': {
      'en': 'to communication with robot',
      'ar': '',
    },
    'keyx4ouk': {
      'en': '',
      'ar': '',
    },
    'v3nkfwo1': {
      'en': '',
      'ar': '',
    },
    'mfs6rh0u': {
      'en': '',
      'ar': '',
    },
    '8w0dcdle': {
      'en': '',
      'ar': '',
    },
    'tqkd9uiy': {
      'en': '',
      'ar': '',
    },
    'x659xmo6': {
      'en': '',
      'ar': '',
    },
    'okvidh6t': {
      'en': '',
      'ar': '',
    },
    'bqz4r5lc': {
      'en': '',
      'ar': '',
    },
    'bfugg9t8': {
      'en': '',
      'ar': '',
    },
    'ql33fb73': {
      'en': '',
      'ar': '',
    },
    'j15pot6i': {
      'en': '',
      'ar': '',
    },
    'i0wdpn1z': {
      'en': '',
      'ar': '',
    },
    'oytal9y5': {
      'en': '',
      'ar': '',
    },
    'g3h33jfx': {
      'en': '',
      'ar': '',
    },
    'bifww7gc': {
      'en': '',
      'ar': '',
    },
    'lxtdmnj9': {
      'en': '',
      'ar': '',
    },
    'wia3f9f6': {
      'en': '',
      'ar': '',
    },
    'k9q2kjnk': {
      'en': '',
      'ar': '',
    },
    'gpti9z5z': {
      'en': '',
      'ar': '',
    },
    'v9g5e2kf': {
      'en': '',
      'ar': '',
    },
    '9dunnwe7': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
