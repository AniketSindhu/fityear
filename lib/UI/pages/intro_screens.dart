import 'package:fityear/UI/pages/homepage.dart';
import "package:flutter/material.dart";
import 'package:fityear/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

class Intro extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Intro> {
  List<SliderModels> sliderList= new List<SliderModels>();
  PageController pgcont= new PageController(initialPage: 0);
  int curInd=0;
  @override
  void initState(){
    super.initState();
    sliderList= getSlides();
  }

  Widget curpagehghlght(bool iscurPage){
    return Container(

      height: iscurPage?20.0:8.0,
      width: iscurPage?20.0:8.0,
      decoration: BoxDecoration(
        color: iscurPage?Color(0xff1736F9):Color(0xff609FFE),
        borderRadius: BorderRadius.circular(10.0),
      ),

    );
  }


  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView.builder(
          controller: pgcont,
          itemCount: sliderList.length,
          onPageChanged: (val){
            setState(() {
              curInd=val;
            });

          },
          itemBuilder:(context,index){

            return SliderPart(
              imn: sliderList[index].getimgPath(),
              title: sliderList[index].gettit(),
              desc: sliderList[index].getdes(),
              p: index,
            );
          }

      ),

      bottomSheet: curInd!=sliderList.length-1 ?Container(
        margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
        height: 50.0,

        decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0
              )
            ],
            border: Border.all(
              //color: Color((0xff1736F9)),
              width: 5,

            ),
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20.0)
        ),

        padding: EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap:(){
                pgcont.animateToPage(2, duration: Duration(milliseconds: 600), curve: Curves.linear);
              } ,
              child: Text('Skip',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,fontSize: 18.0),),
            ),
            Row(
              children: <Widget>[
                for(int i=0;i<sliderList.length;i++)curInd==i ?curpagehghlght(true).px8():curpagehghlght(false).px8(),
              ],
            ),
            InkWell(
              onTap:(){
                pgcont.animateToPage(curInd+1, duration: Duration(milliseconds: 600), curve: Curves.linear);

              } ,
              child: Text('Next',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,fontSize: 18.0),),
            ),

          ],

        ),


      ):
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        },
        child:Container(
          margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
          height: 50.0,

          alignment: Alignment.center,
          child: Text('Get Started',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 20.0),),
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,

              )
            ],
            color: Color(0xff1736F9),

            borderRadius:BorderRadius.circular(20.0),
          ),
        ),
      ),

    );
  }
}
class SliderPart extends StatelessWidget {
  String imn,title ,desc;
  int p;
  SliderPart({this.imn,this.title,this.desc,this.p});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(top: 200.0),
      child: Column(
        children: <Widget>[
          Image.asset(imn),
          SizedBox(
            height: 20.0,
          ),
          Text(title,style: TextStyle(fontSize:30.0,fontWeight: FontWeight.bold), ),
          SizedBox(
            height: 20.0,
          ),
          Text(desc,textAlign: TextAlign.center,style:TextStyle(fontSize:18.0,fontWeight: FontWeight.w400),).px16(),
        ],
      ),
    );
  }
}



