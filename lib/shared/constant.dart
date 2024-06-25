import 'package:firebase_auth/firebase_auth.dart';

dynamic uId =FirebaseAuth.instance.currentUser?.uid;

 String? typeInter;

class Constants
{
 static const int cardPaymentMethodIntegrationId = 4597944;///4597944
 static const String apiKey = 'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RneE5qTXdMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkudklXeG9xS082SmQyWHFaUndGTE1GcHFSNElLMHFhdjJFTGs3a05NZURaZ21qcExCemJ4cUFYd3Q2c2dMclVFOGFhTlZKY185NkxFSkJFZVktMkExTFE=';
}