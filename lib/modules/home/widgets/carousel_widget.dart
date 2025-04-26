import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tujuh_sembilan_request/modules/home/model/carousel_data.dart';
import 'package:tujuh_sembilan_request/modules/home/widgets/custom_button.dart';

class CarouselWidget extends StatefulWidget {
  final List<CarouselData> datas;

  const CarouselWidget({super.key, required this.datas});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final PageController controller = PageController();
  int caouselIndex = 0;

  double progress = 0.0;
  Timer? _progressTimer;
  Timer? _interactionDelayTimer;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  @override
  void dispose() {
    controller.dispose();
    _progressTimer?.cancel();
    _interactionDelayTimer?.cancel();
    super.dispose();
  }

  void _startProgress() {
    _progressTimer?.cancel();
    progress = 0.0;

    _progressTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!mounted) return;

      setState(() {
        progress += 0.01;
      });

      if (progress >= 1.0) {
        timer.cancel();
        progress = 0.0;

        final nextIndex = (caouselIndex + 1) % widget.datas.length;
        controller
            .animateToPage(
              nextIndex,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            )
            .then((_) {
              if (mounted) {
                setState(() => caouselIndex = nextIndex);
                _startProgress();
              }
            });
      }
    });
  }

  void _pauseProgress() {
    _progressTimer?.cancel();
  }

  void _resumeProgress() {
    _startProgress();
  }

  void _restartAutoScrollWithDelay() {
    _progressTimer?.cancel();
    _interactionDelayTimer?.cancel();

    progress = 0.0;
    setState(() {});

    _interactionDelayTimer = Timer(const Duration(seconds: 5), () {
      _startProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pauseProgress(),
      onPanDown: (_) => _pauseProgress(),
      onPanCancel: _resumeProgress,
      onPanEnd: (_) => _resumeProgress(),
      onTapUp: (_) => _resumeProgress(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 144,
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.datas.length,
              onPageChanged: (value) {
                setState(() => caouselIndex = value);
                _restartAutoScrollWithDelay();
              },
              itemBuilder:
                  (ctx, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: widget.datas[index].color,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -20,
                          top: -20,
                          bottom: -20,
                          child: Image.asset(
                            widget.datas[index].image,
                            height: 160,
                            width: 144,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          bottom: 16,
                          left: 16,
                          right: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.datas[index].title,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              CustomCarouselButton(
                                title: widget.datas[index].actionText,
                                titleColor: widget.datas[index].color,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: List.generate(widget.datas.length, (index) {
              final isActive = index == caouselIndex;
              return GestureDetector(
                onTap: () {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() => caouselIndex = index);
                  _restartAutoScrollWithDelay();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: isActive ? 30 : 10,
                  height: 10,
                  child:
                      isActive
                          ? Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(360),
                                  color: Colors.black12,
                                ),
                              ),
                              FractionallySizedBox(
                                widthFactor: progress.clamp(0.0, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(360),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              color: Colors.black12,
                            ),
                          ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
