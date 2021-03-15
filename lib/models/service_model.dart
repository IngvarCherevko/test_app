class ServiceModel{
  ServiceModel(
      {this.title,
      this.imageUrl,
      this.stars,
      this.minPrice,
      this.maxPrice,
      this.currency,
      this.estimateDate,
      this.publicationDate});

  String title;
  String imageUrl;
  int stars;
  int minPrice;
  int maxPrice;
  String currency;
  int estimateDate;
  String publicationDate;

  //TODO: implement serialization here

 ServiceModel getMockModel(){
   return ServiceModel(
       title: 'Sprzątanie pokoju',
       imageUrl: 'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
       stars: 4,
       minPrice: 90,
       maxPrice: 100,
       currency: 'zł',
       estimateDate: 490,
     publicationDate: '4',
     );
 }

  List<ServiceModel> getMockModelList(){
    return [
    ServiceModel(
      title: 'Sprzątanie pokoju',
      imageUrl: 'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
      stars: 4,
      minPrice: 90,
      maxPrice: 100,
      currency: 'zł',
      estimateDate: 4,
      publicationDate: '2',
    ),
      ServiceModel(
        title: 'Wynajmę dla Ciebie fajne mieszkanie',
        imageUrl: 'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
        stars: 3,
        minPrice: 60,
        maxPrice: 80,
        currency: 'zł',
        estimateDate: 7,
        publicationDate: '4',
      ),
      ServiceModel(
        title: 'Sprzątanie pokoju',
        imageUrl: 'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
        stars: 5,
        minPrice: 90,
        maxPrice: 100,
        currency: 'zł',
        estimateDate: 7,
        publicationDate: '6',
      ),
      ServiceModel(
        title: 'Sprzątanie pokoju',
        imageUrl: 'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
        stars: 4,
        minPrice: 90,
        maxPrice: 100,
        currency: 'zł',
        estimateDate: 9,
        publicationDate: '8',
      ),
      ServiceModel(
        title: 'Sprzątanie pokoju',
        imageUrl: 'https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png',
        stars: 4,
        minPrice: 90,
        maxPrice: 100,
        currency: '\$',
        estimateDate: 4,
        publicationDate: '4',
      ),
    ];
  }


}