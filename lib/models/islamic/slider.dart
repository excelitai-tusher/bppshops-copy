class MainSlider {
  List<Sliders>? slider;

  MainSlider({this.slider});

  MainSlider.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Sliders>[];
      json['slider'].forEach((v) {
        slider!.add(new Sliders.fromJson(v));
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

class Sliders {
  String? sliderImg;

  Sliders({this.sliderImg});

  Sliders.fromJson(Map<String, dynamic> json) {
    sliderImg = json['slider_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slider_img'] = this.sliderImg;
    return data;
  }
}