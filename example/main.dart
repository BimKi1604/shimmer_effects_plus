import 'package:flutter/material.dart';
import 'package:shimmer_effects_plus/src/data/shimmer_data.dart';
import 'package:shimmer_effects_plus/src/widget/component/shimmer_list.dart';
import 'package:shimmer_effects_plus/src/widget/component/shimmer_list_page.dart';
import 'package:shimmer_effects_plus/src/widget/shimmer_effects_plus/shimmer_effect_view.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shimmer Tile Example',
      home: ShimmerPage(),
    );
  }
}

class ShimmerPage extends StatefulWidget {
  const ShimmerPage({super.key});

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}

class _ShimmerPageState extends State<ShimmerPage> with SingleTickerProviderStateMixin{

  int waitingTime = 3; /// seconds
  ValueNotifier<int> _remainingS = ValueNotifier(3);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _remainingS.dispose();
    super.dispose();
  }

  void _startCountdown() async {
    _remainingS = ValueNotifier(3);
    while (_remainingS.value > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _remainingS.value -= 1;
    }
  }

  Future<void> funcHideShimmerWhenFinish() async { /// function async
    await Future.delayed(Duration(milliseconds: waitingTime)); /// remember await function action (load api, read file, ... )
  }

  @override
  Widget build(BuildContext context) {
    _startCountdown();
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Shimmer Effect")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Example loading shimmer effect and show child when event finished", /// Loading shimmer and show child when event finished
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange)),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  ShimmerEffectWidget.auto(
                    subColor: Colors.grey[300]!,
                    mainColor: Colors.grey[100]!,
                    period: const Duration(milliseconds: 1200),
                    funcShimmer: () async {
                      await funcHideShimmerWhenFinish();
                    },
                    direction: ShimmerDirection.ttb,
                    child: Container(width: 100, height: 100, color: Colors.red),
                  ),
                  const SizedBox(width: 20.0,),
                  ValueListenableBuilder<int>(
                    valueListenable: _remainingS,
                    builder: (context, s, _) {
                      return Text("$s s", style: const TextStyle(fontSize: 24));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Text("Example with param container",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange)),
              const SizedBox(height: 10.0),
              ShimmerEffectWidget.cover(
                subColor: Colors.grey[300]!,
                mainColor: Colors.grey[100]!,
                period: const Duration(milliseconds: 1200),
                direction: ShimmerDirection.ttb,
                child: Container(width: 100, height: 100, color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              const Text("Example with param text",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange)),
              ShimmerEffectWidget.cover(
                subColor: Colors.grey[800]!,
                mainColor: Colors.grey[400]!,
                period: const Duration(milliseconds: 1500),
                direction: ShimmerDirection.ttb,
                child: const Text(
                  "Shimmer loading text",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              const Text("Example shape",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange)),
              ShimmerEffectWidget.cover(
                subColor: Colors.grey[800]!,
                mainColor: Colors.grey[400]!,
                period: const Duration(milliseconds: 1500),
                direction: ShimmerDirection.ttb,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text("Circle",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent)),
                            const SizedBox(height: 5.0),
                            ShimmerEffectWidget.circle(size: 60),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Text("Rectangle",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent)),
                            const SizedBox(height: 5.0),
                            ShimmerEffectWidget.rectangle(
                              width: 60,
                              height: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Text("Triangle",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent)),
                            const SizedBox(height: 5.0),
                            ShimmerEffectWidget.triangle(size: 60),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text("Example shimmer list",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange)),
              const ShimmerList(
                qtyLine: 2,
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text("Example shimmer list page",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange)),
              const ShimmerListPage(
                qtyPerLine: 3,
                quantity: 3,
                shape: ShimmerShapeType.square,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
