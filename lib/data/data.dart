

class SliderModels {
  String imgpath, tit, des;

  SliderModels({this.imgpath, this.tit, this.des});

  void setimgPath(String x) {
    imgpath = x;
  }

  void settit(String x) {
    tit = x;
  }

  void setdesc(String x) {
    des = x;
  }

  String getimgPath() {
    return imgpath;
  }

  String gettit() {
    return tit;
  }

  String getdes() {
    return des;
  }
}

List<SliderModels> getSlides(){
  List<SliderModels> slideList= new List<SliderModels>();

  SliderModels slide = new SliderModels();
  slide.setimgPath("assets/1.PNG");
  slide.settit("Let's Begin !");
  slide.setdesc("");
  slideList.add(slide);

  slide = new SliderModels();
  slide.setimgPath("assets/2.PNG");
  slide.settit("Track Your Progress");
  slide.setdesc("“No matter how many mistakes you make or how slow you progress, you are still way ahead of everyone who isn’t trying.” —Tony Robbins");
  slideList.add(slide);

  slide = new SliderModels();
  slide.setimgPath("assets/3.PNG");
  slide.settit("Compete With Friends");
  slide.setdesc(" “Competition is always a good thing. It forces us to do our best. A monopoly renders people complacent and satisfied with mediocrity.”  – Nancy Pearcy");
  slideList.add(slide);

  return slideList;


}



