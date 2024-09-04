import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mock_mechine_test2/custom_appbar.dart';
import 'package:mock_mechine_test2/main_list_tile.dart';

class InteractivePieChart extends StatefulWidget {
  const InteractivePieChart({super.key});

  @override
  State<InteractivePieChart> createState() => _InteractivePieChartState();
}

class _InteractivePieChartState extends State<InteractivePieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isAnimating = false;
  late Timer _animationTimer;
  final int _animationDuration = 5000; // Duration for animation in milliseconds
  int? _animatedSectionIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  void _startLoadingAnimation() {
    if (!isAnimating) {
      setState(() {
        isAnimating = true;
      });

      // Start the animation timer
      _animationTimer =
          Timer.periodic(const Duration(milliseconds: 500), (timer) {
        if (!isAnimating) {
          timer.cancel();
          return;
        }

        // Trigger animation for a random section
        _triggerRandomSectionAnimation();
      });

      // Stop animation after a certain duration
      Future.delayed(Duration(milliseconds: _animationDuration), () {
        setState(() {
          isAnimating = false;
        });
        _animationTimer.cancel();
        _controller.reverse();
      });

      // Start the animation
      _controller.forward();
    }
  }

  void _triggerRandomSectionAnimation() {
    final random = Random();
    int sectionCount = 3; // Number of sections in the pie chart
    int newSectionIndex;

    do {
      newSectionIndex = random.nextInt(sectionCount);
    } while (newSectionIndex ==
        _animatedSectionIndex); // Ensure the section is different from the previous one

    setState(() {
      _animatedSectionIndex = newSectionIndex;
    });

    _controller.forward(from: 0).then((_) {
      if (isAnimating) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1B1B2F),
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: _startLoadingAnimation,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    PieChart(
                      PieChartData(
                        centerSpaceColor: Colors.white,
                        startDegreeOffset: 270,
                        sectionsSpace: 0,
                        centerSpaceRadius: 60,
                        sections: showingSections(),
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            if (event is FlTapUpEvent) {
                              _startLoadingAnimation();
                            }
                          },
                        ),
                      ),
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$1426.7',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Last \$234.67',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 37, 37, 61)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return const MainListTile();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    const double baseRadius = 30;

    return [
      PieChartSectionData(
        color: Colors.orange,
        value: 42,
        title: '',
        radius: _animatedSectionIndex == 0
            ? 2 * baseRadius * _animation.value
            : baseRadius,
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 33,
        title: '',
        radius: _animatedSectionIndex == 1
            ? 1.5 * baseRadius * _animation.value
            : baseRadius,
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 25,
        title: '',
        radius: _animatedSectionIndex == 2
            ? 2 * baseRadius * _animation.value
            : baseRadius,
      ),
    ];
  }
}
