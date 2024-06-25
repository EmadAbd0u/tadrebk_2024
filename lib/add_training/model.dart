
class PostModel {
  String? image;
  String? uId;


 String? companyName;
 String? trainingName;
 String? city;
 String? street;
 String? trainingSpecialization;
 String? trainingCost;
 String? trainingDescription;
 String? startDate;
 String? endDate;

 String? category;
 String? isLiked;
 String? companyUid;

 String? paymentUid;
 String? isPaid;



  PostModel({
    required this.companyName,
    required this.city,
    required this.uId,
    required this.image,
    required this.street,
    required this.trainingSpecialization,
    required this.trainingCost,
    required this.trainingDescription,
    required this.startDate,
    required this.endDate,
    required this.trainingName,
    required this.category,
    required this.isLiked,
    required this.companyUid,
    required this.isPaid,
    required this.paymentUid,

  });

  PostModel.fromJson(Map<String ,dynamic > json){

    companyName = json['companyName'];
    category = json['category'];
    trainingName = json['trainingName'];
    city = json['city'];
    uId = json['uId'];
    image = json['image'];
    street = json['street'];
    trainingSpecialization = json['trainingSpecialization'];
    trainingCost = json['trainingCost'];
    trainingDescription = json['trainingDescription'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isLiked = json['isLiked'];
    companyUid = json['companyUid'];
    isPaid = json['isPaid'];
    paymentUid = json['paymentUid'];


  }

  Map<String, dynamic>  toMap (){

    return {
      'uId' : uId,
      'image':image,
      'companyName':companyName,
      'trainingName':trainingName,
      'category':category,
      'city':city,
      'street':street,
      'trainingSpecialization':trainingSpecialization,
      'trainingCost':trainingCost,
      'trainingDescription':trainingDescription,
      'startDate':startDate,
      'endDate':endDate,
      'isLiked':isLiked,
      'companyUid':companyUid,
      'isPayed':isPaid,
      'paymentUid':paymentUid,

    };

  }
}
