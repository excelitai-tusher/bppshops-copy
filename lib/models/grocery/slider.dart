class GrocerySlider {
  List<GSliders>? slider;

  GrocerySlider({this.slider});

  GrocerySlider.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <GSliders>[];
      json['slider'].forEach((v) {
        slider!.add(new GSliders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GSliders {
  String? sliderImg;

  GSliders({this.sliderImg});

  GSliders.fromJson(Map<String, dynamic> json) {
    sliderImg = json['slider_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slider_img'] = this.sliderImg;
    return data;
  }
}