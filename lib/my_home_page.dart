import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation animation2;
  late Animation animation3;
  late Animation animation4;
  late Animation colorAnimation;
  late Animation colorAnimation2;
  late Animation colorAnimation3;
  late Animation colorAnimation4;
  late AnimationController animationController;
  bool _isAnimating = false;
  void toggleAnimation() {
    if (_isAnimating) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
    _isAnimating = !_isAnimating;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin:0.0,end:200.0).animate(animationController);
    animation2 = Tween(begin:0.0,end:150.0).animate(animationController);
    animation3 = Tween(begin:0.0,end:100.0).animate(animationController);
    animation4 = Tween(begin:0.0,end:50.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.black , end:  Colors.white).animate(animationController);
    colorAnimation2 = ColorTween(begin: Colors.red , end:  Colors.black).animate(animationController);
    colorAnimation3 = ColorTween(begin: Colors.yellow , end:  Colors.orange).animate(animationController);
    colorAnimation4 = ColorTween(begin: Colors.purple , end:  Colors.purpleAccent).animate(animationController);
    animationController.addListener(() {
      print(animation.value);
      setState(() {

      });

    });
    animationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text('Tween Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children:[
                Container(
                width: animation.value,
                height: animation.value,
                decoration: BoxDecoration(shape: BoxShape.circle,color: colorAnimation.value,),
              ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 20,
                  bottom: 0,
                  child: Container(
                    width: animation2.value,
                    height: animation2.value,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: colorAnimation2.value,),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 35,
                  bottom: 0,
                  child: Container(
                    width: animation3.value,
                    height: animation3.value,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: colorAnimation3.value,),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  top: 50,
                  bottom: 0,
                  child: Container(
                    width: animation4.value,
                    height: animation4.value,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: colorAnimation4.value,),
                  ),
                ),
              ]
            ),
            ElevatedButton(onPressed: (){
              toggleAnimation();
            },  child: Text(_isAnimating ? 'Stop Animation' : 'Start Animation'), )
          ],
        ),
      ),
    );
  }
}
