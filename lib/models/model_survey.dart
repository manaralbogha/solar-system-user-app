class SurveyModel {
  int? ourProduct;
  int? ourCompanies;
  int? ourUsers;
  int? ourTeams;
  int? ourOrders;

  SurveyModel(
      {this.ourProduct,
      this.ourCompanies,
      this.ourUsers,
      this.ourTeams,
      this.ourOrders});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    ourProduct = json['OurProduct'];
    ourCompanies = json['OurCompanies'];
    ourUsers = json['OurUsers'];
    ourTeams = json['OurTeams'];
    ourOrders = json['OurOrders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OurProduct'] = this.ourProduct;
    data['OurCompanies'] = this.ourCompanies;
    data['OurUsers'] = this.ourUsers;
    data['OurTeams'] = this.ourTeams;
    data['OurOrders'] = this.ourOrders;
    return data;
  }
}
