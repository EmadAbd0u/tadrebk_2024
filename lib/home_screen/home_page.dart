import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/profile/profile.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/sign_up_screen/sign_up.dart';
import 'package:url_launcher/url_launcher.dart';


import '../get_trainings/get_all_trainings.dart';
import '../login_screen/login.dart';
import '../profile/cubit.dart';
import '../profile/states.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../training_categories/training_categories.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{

  bool isLoggedIn = false;
  bool isClosed   = true;


  List<String> messages = [];
  TextEditingController _controller = TextEditingController();

  bool isEnglish = true;

  void _sendWelcomeMessage() {
    messages.clear();
    messages.add('Bot: Welcome! How can I assist you today?');
    messages.add('Bot: مرحباً! كيف يمكنني مساعدتك اليوم؟');
    messages.add('Bot:\n1. Interact in English\n2. التفاعل باللغة العربية');
    setState(() {});
  }
  void _handleLanguageSelect(int languageChoice)
  {
    if (languageChoice == 1) {
      isEnglish = true;
      messages.add('You: 1');
      _sendBotMessage();
    } else if (languageChoice == 2) {
      isEnglish = false;
      messages.add('You: 2');
      _sendBotMessage();
    }
  }

  Future<void> _sendBotMessage() async {
    if (isEnglish) {
      messages.add('Bot:\n0. Back to main menu\n1. What training areas are available on the "Tadreebk" platform?\n'
          '2. How can I register for a course on "Tadreebk"?\n'
          '3. Are there accredited certificates available upon course completion?\n'
          '4. Are there any additional fees related to professional training after the initial payment?\n'
          '5. Talk to a customer service representative?\n');
    } else {
      messages.add('Bot:\n0. العودة إلى القائمة الرئيسية\n1. ما هي المجالات التدريبية المتاحة على منصة "تدريبك"؟\n'
          '2. كيف يمكنني التسجيل في دورة تدريبية على "تدريبك"؟\n'
          '3. هل هناك شهادات معتمدة متاحة عند اكمال الدورة التدريبية؟\n'
          '4. هل هناك رسوم إضافية تتعلق بالتدريبات المهنية بعد الدفع الأساسي؟\n'
          '5. التحدث الى احد ممثلي خدمة العملاء؟\n');
    }
    setState(() {});
  }

  void _handleQuestionSelect(int questionNumber) {
    if (questionNumber == 0)
    {
      _sendWelcomeMessage();

    } else {
      String question = '$questionNumber';
      String answer = getAnswerForQuestion(question);
      messages.add('You: $question');
      messages.add('Bot: $answer');
      setState(() {});
    }
  }

  String getAnswerForQuestion(String question) {
    if (isEnglish) {
      switch (question) {
        case '1':
          return 'You can find a variety of training areas on the "Tadreebk" platform, including technology, marketing, management, languages, personal skills, and many more.';
        case '2':
          return 'You can register for courses on the "Tadreebk" platform by following simple steps. First, search for the course that suits you among the available courses. Then, follow the specified steps to complete the registration process, whether the course is free or paid.';
        case '3':
          return 'Yes, upon successful completion of the training course, you will receive an accredited certificate proving your completion of the course and the skills acquired. You can use this certificate to demonstrate your qualifications in the field you have trained in.';
        case '4':
          return 'Usually, all fees related to professional training are determined and paid in advance, and there are typically no additional fees. However, you should check the platform’s policy and the specific course terms to ensure there are no unexpected additional fees.';
        case '5':
          return 'You are being transferred, please wait...';
        default:
          return 'Sorry, I don\'t understand that question.';
      }
    } else {
      switch (question) {

        case '1':
          return 'يمكنك العثور على مجموعة متنوعة من المجالات التدريبية على منصة "تدريبك". تشمل هذه المجالات التكنولوجيا، والتسويق، والإدارة، واللغات، والمهارات الشخصية، وغيرها الكثير.';
        case '2':
          return 'يمكنك التسجيل في الدورات التدريبية على منصة "تدريبك" باتباع خطوات بسيطة. أولاً، ابحث عن الدورة التدريبية المناسبة لك من بين الدورات المتاحة. ثم، اتبع الخطوات المحددة لإتمام عملية التسجيل، سواء كانت الدورة مجانية أو مدفوعة.';
        case '3':
          return 'نعم، بعد اكتمال الدورة التدريبية بنجاح، ستحصل على شهادة معتمدة تُثبت اجتيازك للدورة واكتسابك للمهارات المطلوبة. هذه الشهادة يمكنك استخدامها لإثبات مؤهلاتك في المجال الذي قمت بتدريبه.';
        case '4':
          return 'في العادة، يتم تحديد جميع الرسوم المتعلقة بالتدريبات المهنية ودفعها مقدمًا، ولا تتوجد رسوم إضافية عادةً. ومع ذلك، يجب عليك التحقق من سياسة المنصة وشروط الدورة التدريبية المحددة للتأكد من عدم وجود رسوم إضافية غير متوقعة.';
        case '5':
          return 'يتم تحويلك الآن، الرجاء الانتظار...';
        default:
          return 'عذرًا، لا أفهم هذا السؤال.';
      }
    }
  }


 @override
  void initState() {

    isLoggedIn = cachHelper.getData(key: 'type')!=null;
    ProfileCubit.get(context).getUserData();
    ProfileCubit.get(context).getCompanyData();
    _sendWelcomeMessage();

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProfileCubit,ProfileStatus>(
      listener: (context,state){},
      builder: (context,state){

        final windowWidth = MediaQuery.of(context).size.width;
        final windowHeight = MediaQuery.of(context).size.height;

        return windowWidth >=1100 && windowHeight >=600 ?  Scaffold(
          body: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        HeaderWidget(
                          index: 0,
                        ),

                        Stack(
                          children: [
                            Image.asset('assets/images/img_1.png',
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.84,
                                fit: BoxFit.fill),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: MediaQuery.of(context).size.height * 0.76,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 40, left: 80,right: 80),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.24,
                                          height:
                                          MediaQuery.of(context).size.height * 0.4,
                                          child: const Column(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: LocaleText(
                                                  'develop',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 34,
                                                    color: Colors.amber,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.start, // توجيه النص إلى اليمين
                                                ),
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),
                                              Expanded(
                                                flex: 2,


                                                child: LocaleText(
                                                  'description',
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 19),
                                                  textAlign: TextAlign.start, // توجيه النص إلى اليمين


                                                ),

                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: MediaQuery.of(context).size.height * 0.22,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: MediaQuery.of(context).size.width *
                                                    0.08,
                                                height:
                                                MediaQuery.of(context).size.height *
                                                    0.2,
                                                child: Card(
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 8),
                                                          child: Image.asset(
                                                            'assets/images/img_10.png',
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                0.04,
                                                            height: MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.1,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '30000+',
                                                        style: TextStyle(
                                                          color: mainColor,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom: 6),
                                                        child: LocaleText(
                                                          'training',
                                                          style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18),
                                                          textAlign: TextAlign.center,

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: MediaQuery.of(context).size.width *
                                                    0.08,
                                                height:
                                                MediaQuery.of(context).size.height *
                                                    0.2,
                                                child: Card(
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 8),
                                                          child: Image.asset(
                                                            'assets/images/img_11.png',
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                0.04,
                                                            height: MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.1,
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom: 6),
                                                        child: LocaleText(
                                                          'certificate',
                                                          style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 18),
                                                          textAlign: TextAlign.center,

                                                        ),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: MediaQuery.of(context).size.width *
                                                    0.08,
                                                height:
                                                MediaQuery.of(context).size.height *
                                                    0.2,
                                                child: Card(
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 8),
                                                          child: Image.asset(
                                                            'assets/images/img_7.png',
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                0.04,
                                                            height: MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.1,
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom: 6),
                                                        child: LocaleText(
                                                          'add_training',
                                                          style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w600,
                                                                                                                            fontSize: 20,
                                                          ),
                                                          textAlign: TextAlign.center,
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
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: MediaQuery.of(context).size.height * 0.64,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/img_8.png',
                                            width:
                                            MediaQuery.of(context).size.width * 0.32,
                                            height:
                                            MediaQuery.of(context).size.height * 0.44,
                                          ),
                                          Image.asset(
                                            'assets/images/img_8.png',
                                            width:
                                            MediaQuery.of(context).size.width * 0.32,
                                            height:
                                            MediaQuery.of(context).size.height * 0.4,
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/img_5.png',
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.34,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/img_13.png',
                                              width: MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                            ClipRect(
                                              clipper: TopClipper(),
                                              child: Image.asset(
                                                'assets/images/img_12.png',
                                                width: MediaQuery.of(context).size.width *
                                                    0.18,
                                                height:
                                                MediaQuery.of(context).size.height *
                                                    0.48,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 100,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.12,
                              height: MediaQuery.of(context).size.width*0.03,
                              color: mainColor,
                              child: Center(child: LocaleText('our_services',

                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: mainFont,
                                    color: Colors.white
                                ),
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.7,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                introComponents(
                                    context,
                                    'assets/images/img_18.png',
                                    'training',
                                    'description_zero'

                                ),
                                introComponents(
                                    context,
                                    'assets/images/img_19.png',
                                    'certificate',
                                    'description_one'

                                ),
                                introComponents(
                                    context,
                                    'assets/images/img_20.png',
                                    'find_your_training',
                                    'description_two'
                                ),
                                introComponents(
                                    context,
                                    'assets/images/img_21.png',
                                    'add_training',
                                    'description_three'
                                ),
                                const SizedBox(width: 4,),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.95,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            ),
                          ),


                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                LocaleText('our_trainings',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: mainFont,
                                      color: mainColor
                                  ),



                                ),
                                const SizedBox(
                                  height: 40,
                                ),

                                Padding(

                                  padding: const EdgeInsets.only(
                                    left:100.0,
                                    right: 100.0,
                                  ),
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('posts')
                                        .snapshots(),
                                    builder: (context, snapshots) {
                                      return (snapshots.connectionState ==
                                          ConnectionState.waiting)
                                          ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                          : GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),

                                        shrinkWrap: true,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:3,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.88, // Adjust the aspect ratio as needed

                                        ),
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          var data = snapshots.data!.docs[index]
                                              .data() as Map<String, dynamic>;

                                          return trainingID(
                                            image: data['image'] ?? '',
                                            companyName: data['companyName'],
                                            city: data['city'],
                                            street: data['street'],
                                            trainingSpecialization:
                                            data['trainingSpecialization'],
                                            trainingCost: data['trainingCost'],
                                            trainingDescription:
                                            data['trainingDescription'],
                                            startDate: data['startDate'],
                                            endDate: data['endDate'],
                                            category: data['category'],
                                            trainingName: data['trainingName'],
                                            id:data['uId'],
                                            isLiked: data['isLiked'],
                                            isPaid: data['isPaid']??'',
                                            context: context,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.12,
                                  height: MediaQuery.of(context).size.width*0.03,
                                  color: mainColor,
                                  child: Center(child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const GetAllTrainings()));
                                    },
                                    child: LocaleText('view_courses',

                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: mainFont,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.66,
                          decoration: BoxDecoration(

                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                HexColor('#1B3358'),
                                mainColor
                              ],
                            ),
                          ),

                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              LocaleText('customer_reviews',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: mainFont,
                                    color: Colors.white
                                ),



                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100,right: 100),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    reviewWidget(context,
                                        'Emad abdu',
                                        'address',
                                        'comment'
                                    ),
                                    reviewWidget(context,
                                        'Mina Milad',
                                        'address',
                                        'comment'
                                    ),
                                    reviewWidget(context,
                                        'Emad abdu',
                                        'address',
                                        'comment'
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('+30K ',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: mainColor,
                                      fontFamily: mainFont,
                                    ),


                                  ),
                                  LocaleText('training',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: mainColor,
                                      fontFamily: mainFont,
                                    ),


                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('+50K ',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: mainColor,
                                      fontFamily: mainFont,
                                    ),


                                  ),
                                  LocaleText('views',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: mainColor,
                                      fontFamily: mainFont,
                                    ),


                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('+50K',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: mainColor,
                                      fontFamily: mainFont,
                                    ),


                                  ),
                                  LocaleText('happy_customers',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: mainColor,
                                      fontFamily: mainFont,
                                    ),


                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),



                        footerPage(context),
                      ],
                    ),
                  )),


              Positioned(
                right: 0,
                bottom: 0,
                child:  isClosed
                    ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( top: 20,left: 30,right: 30),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isClosed = false;
                                });
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,

                                child: Image.asset('assets/images/img_36.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(right: 40, bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.08,
                            color:mainColor,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Image.asset('assets/images/img_36.png'),
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    'Smart Assistant',
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isClosed = true;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.minimize,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isClosed = true;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: messages.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Align(
                                  alignment: messages[index].startsWith('Bot')
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: messages[index].startsWith('Bot')
                                          ? const EdgeInsets.only(
                                        right: 40,
                                      )
                                          : const EdgeInsets.all(0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: messages[index]
                                              .startsWith('Bot')
                                              ? const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          )
                                              : const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          color: messages[index].startsWith('Bot')
                                              ? Colors.blueGrey[200]
                                              : Colors.lightGreen,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        child: Text(messages[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          IconTheme(
                            data: const IconThemeData(color: Colors.black),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _controller,
                                      onSubmitted: (value) {
                                        _controller.text = value;
                                      },
                                      decoration: const InputDecoration.collapsed(
                                        hintText: 'Type a Question Number',
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: () {
                                      int? selectedQuestion = int.tryParse(_controller.text);
                                      if (selectedQuestion != null &&
                                          selectedQuestion >= 0 && // تحقق من أن الرقم أكبر من صفر
                                          selectedQuestion <= 5) {
                                        if (messages.length == 3) {
                                          _handleLanguageSelect(selectedQuestion);
                                        } else {
                                          _handleQuestionSelect(selectedQuestion);
                                        }
                                        _controller.clear();
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Question Number'),
                                              content: const Text(
                                                  'Please enter a valid question number.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) : Container();
      },
    );
  }
}

class TopClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 1, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}






Widget introComponents(
    context,
    image,
    text1,
    text2
    ){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 20,top: 60,),
      child: Container(
        width: MediaQuery.of(context).size.width*0.23,
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(

          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.14,
              height: MediaQuery.of(context).size.height*0.26,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(image,
                fit: BoxFit.cover,

              ),
            ),
            const SizedBox(
              height: 8,
            ),
            LocaleText(text1,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: mainFont,
                  color: mainColor
              ),

            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: LocaleText(
                text2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: mainFont,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.start, // توجيه النص إلى اليمين
              ),
            ),

          ],
        ),
      ),
    ),
  );
}



Widget reviewWidget(
    context,
    name,
    address,
    description
    ){
  return  SizedBox(
    child: Container( width: MediaQuery.of(context).size.width*0.26,
      height: MediaQuery.of(context).size.height*0.32,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
              child: Container(
                width: MediaQuery.of(context).size.width*0.26,
                height: MediaQuery.of(context).size.height*0.14,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 30,
                      backgroundImage: const AssetImage('assets/images/img_34.png'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14,bottom: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(name,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: mainFont,

                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,


                            ),
                          ),
                          Expanded(
                            child: LocaleText(address,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: mainFont,
                                  color: Colors.grey

                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,


                            ),
                          ),
                          Row(
                            children: [


                              Text(
                                '4.9',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                    color: mainColor
                                ),
                              ),

                              const SizedBox(width: 5),


                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                                size: 14,
                              ),
                              Icon(
                                Icons.star_border,
                                color: mainColor,
                                size: 14,
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,bottom: 20),
              child: LocaleText(
                description,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: mainFont,
                    color: Colors.grey


                ),
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,


              ),
            ),
          ],
        ),

      ),
    ),
  );
}



