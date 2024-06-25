import 'package:flutter/material.dart';
import 'package:tadrebk/shared/header_widget.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Map<String, String> faqs =
  {
    // English FAQs
    'How can I create a new account on the training website?':
    'To create a new account on the training website, follow these steps:\n\n1. Visit the registration page on the website.\n2. Fill out the required information, including your full name, valid email address, and a strong password.\n3. Some websites may require additional information such as date of birth, gender, or country.\n4. Submit the registration form.\n5. You may also have the option to use your social media accounts for easy login, depending on the website\'s policy.',
    'What information is required to complete the registration process?':
    'The required information for completing the registration process may vary from one training website to another, but generally includes:\n\n1. Full name\n2. Valid email address\n3. Strong password\n4. Some websites may ask for additional information such as date of birth, gender, or country.',
    'Can I use my social media account to log in?':
    'Yes, depending on the training website\'s policy, you may be able to use your social media accounts such as Facebook, Twitter, or Google to log in to the website.',
    'How can I update my account information after registration?':
    'To update your account information after registration, follow these steps:\n\n1. Log in to your account on the training website.\n2. Look for the "Account Settings" or "My Profile" section.\n3. Update the information you wish to change, such as your name, email address, or password.',
    'Are there registration fees for using the training website?':
    'The existence of registration fees for using the training website depends on the policy of each website. Some websites may impose registration fees or subscription fees to access premium training content, while others may be free to use.',
    'How can I reset my password if I forget it?':
    'If you forget your password, you can usually reset it by following these steps:\n\n1. Go to the login page.\n2. Look for the "Forgot Password" or "Reset Password" option.\n3. Enter your email address associated with your account.\n4. You will receive an email with instructions on how to reset your password.',
    'Are there special offers or discounts for students or groups?':
    'There may be special offers or discounts for students or groups on training websites, depending on the website\'s policy. It is advisable to check the information about special offers and discounts available on the training website you are interested in.',
    'Can I customize my profile on the training website?':
    'Yes, training websites typically allow you to customize your profile. You can upload a profile picture and fill in additional information such as your resume or personal interests. Your profile serves as a presentation of yourself, and others can view it when interacting with you on the training website.',
    'Is there a rating system for training courses?':
    'The existence of a rating system for training courses depends on the training website you are using. Some websites provide a system for rating courses, where users can provide feedback and ratings on the courses they have completed. This rating can help others make decisions about the courses that are suitable for them.',
    'How can I contact customer support if I encounter a problem during registration?':
    'To contact customer support if you encounter a problem during registration, consider the following steps:\n\n1. Look for the support or contact page on the training website.\n2. You may find contact details such as email or phone number for the support team.\n3. Contact the relevant team or send your inquiry via email.\n4. Describe the problem clearly and provide any additional information the team may need to assist you better.',

    // Arabic FAQs
    'كيف يمكنني إنشاء حساب جديد على الموقع التدريبي؟':
    'لإنشاء حساب جديد على الموقع التدريبي، اتبع الخطوات التالية:\n\n1. قم بزيارة صفحة التسجيل على الموقع.\n2. املأ المعلومات المطلوبة، بما في ذلك الاسم الكامل، عنوان البريد الإلكتروني الصحيح، وكلمة المرور القوية.\n3. قد تحتاج بعض المواقع إلى معلومات إضافية مثل تاريخ الميلاد، الجنس، أو البلد.\n4. قد تواجه خيار استخدام حسابات وسائل التواصل الاجتماعي لتسجيل الدخول بسهولة، وذلك حسب سياسة الموقع.',
    'ما هي المعلومات المطلوبة لإكمال عملية التسجيل؟':
    'تختلف المعلومات المطلوبة لإكمال عملية التسجيل من موقع تدريبي إلى آخر، ولكن عمومًا تشمل:\n\n1. الاسم الكامل\n2. عنوان البريد الإلكتروني الصحيح\n3. كلمة المرور القوية\n4. قد تطلب بعض المواقع معلومات إضافية مثل تاريخ الميلاد، الجنس، أو البلد.',
    'هل يمكنني استخدام حسابي على وسائل التواصل الاجتماعي لتسجيل الدخول؟':
    'نعم، حسب سياسة الموقع التدريبي، قد تكون قادرًا على استخدام حسابات وسائل التواصل الاجتماعي مثل فيسبوك، تويتر، أو جوجل لتسجيل الدخول إلى الموقع.',
    'كيف يمكنني تحديث معلومات حسابي بعد التسجيل؟':
    'لتحديث معلومات حسابك بعد التسجيل، اتبع الخطوات التالية:\n\n1. قم بتسجيل الدخول إلى حسابك على الموقع التدريبي.\n2. ابحث عن قسم "إعدادات الحساب" أو "ملفي الشخصي".\n3. قم بتحديث المعلومات التي ترغب في تغييرها، مثل الاسم، عنوان البريد الإلكتروني، أو كلمة المرور.',
    'هل يوجد رسوم تسجيل لاستخدام الموقع التدريبي؟':
    'تعتمد وجود رسوم تسجيل لاستخدام الموقع التدريبي على سياسة كل موقع. قد تفرض بعض المواقع رسوم تسجيل أو رسوم اشتراك للوصول إلى محتوى تدريبي مميز، في حين قد تكون البعض الآخر مجانية.',
    'كيف يمكنني استعادة كلمة المرور إذا نسيتها؟':
    'إذا نسيت كلمة المرور، يمكنك عادة استعادتها عبر الخطوات التالية:\n\n1. انتقل إلى صفحة تسجيل الدخول.\n2. ابحث عن خيار "نسيت كلمة المرور" أو "إعادة تعيين كلمة المرور".\n3. أدخل عنوان بريدك الإلكتروني المرتبط بحسابك.\n4. ستتلقى رسالة بريد إلكتروني تحتوي على تعليمات حول كيفية إعادة تعيين كلمة المرور الخاصة بك.',
    'هل يوجد عروض خاصة أو خصومات للطلاب أو المجموعات؟':
    'قد تكون هناك عروض خاصة أو خصومات للطلاب أو المجموعات على مواقع التدريب، وذلك حسب سياسة كل موقع. من الأفضل التحقق من معلومات العروض الخاصة والخصومات المتاحة على الموقع التدريبي الذي تهتم به.',
    'هل يمكنني تخصيص ملفي الشخصي على الموقع التدريبي؟':
    'نعم، تسمح مواقع التدريب عادةً بتخصيص ملفك الشخصي. يمكنك تحميل صورة شخصية وتعبئة معلومات إضافية مثل سيرتك الذاتية أو اهتماماتك الشخصية. يعتبر ملفك الشخصي عرضًا لنفسك، ويمكن للآخرين رؤيته عند التفاعل معك على الموقع التدريبي.',
    'هل يوجد نظام تقييم للدورات التدريبية؟':
    'تعتمد وجود نظام تقييم للدورات التدريبية على الموقع التدريبي الذي تستخدمه. بعض المواقع توفر نظامًا لتقييم الدورات التدريبية، حيث يمكن للمستخدمين تقديم تعليقات وتقييمات على الدورات التي قاموا بإتمامها. يمكن أن يساعد هذا التقييم الآخرين في اتخاذ قراراتهم بشأن الدورات المناسبة لهم.',
    'كيف يمكنني التواصل مع فريق الدعم الفني إذا واجهت مشكلة أثناء التسجيل؟':
    'للتواصل مع فريق الدعم الفني إذا واجهت مشكلة أثناء التسجيل، يمكنك اتباع الخطوات التالية:\n\n1. ابحث عن صفحة الدعم الفني أو صفحة الاتصال على الموقع التدريبي.\n2. قد تجد تفاصيل الاتصال مثل البريد الإلكتروني أو رقم الهاتف لفريق الدعم الفني.\n3. قم بالاتصال بالفريق المعني أو إرسال استفسارك عبر البريد الإلكتروني.\n4. وصف المشكلة بوضوح وتقديم أي معلومات إضافية قد يحتاجها الفريق لمساعدتك بشكل أفضل.'
  };


  List<String> chatMessages = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(index: 3),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    chatMessages[index],
                    style: TextStyle(
                      color: chatMessages[index].startsWith('You:') ? Colors.black : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Type your question...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String question = _textEditingController.text;
                    String answer = getAnswer(question) ?? 'Sorry, I don\'t have an answer to that.';
                    setState(() {
                      chatMessages.add('You: $question');
                      chatMessages.add('Bot: $answer');
                      // Check if user asks too many questions without getting answers
                      if (chatMessages.where((message) => !message.startsWith('You:')).length > 3) {
                        chatMessages.add('Bot: We will contact you via customer service shortly.');
                      }
                    });
                    _textEditingController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? getAnswer(String question) {
    String cleanedQuestion = question.trim().toLowerCase();
    String? matchedQuestion = faqs.keys.firstWhere(
          (faq) => faq.toLowerCase() == cleanedQuestion || faq.toLowerCase().contains(cleanedQuestion),
      orElse: () => question,
    );

    return matchedQuestion != null ? faqs[matchedQuestion] : null;
  }
}
