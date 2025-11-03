import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideosWidget extends StatefulWidget {
  const VideosWidget({super.key, this.index, this.loopSingle = true});

  // If provided, the widget will play this single index and loop it.
  // If null, it will play all available videos sequentially.
  final int? index;
  final bool loopSingle;

  @override
  State<VideosWidget> createState() => _VideosWidgetState();
}

class _VideosWidgetState extends State<VideosWidget> {
  final List<String> _assetVideoPaths = const [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
  ];

  late final List<String> _existingAssets;
  VideoPlayerController? _controller;
  int _currentIndex = 0;
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    _prepareAndStart();
  }

  @override
  void didUpdateWidget(covariant VideosWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the requested index changes, (re)initialize to that video
    if (widget.index != oldWidget.index && _existingAssets.isNotEmpty) {
      final idx = _normalizedIndex(widget.index);
      if (idx != null) {
        _initializeControllerForIndex(idx);
      }
    }
  }

  Future<void> _prepareAndStart() async {
    _existingAssets = [];
    for (final path in _assetVideoPaths) {
      try {
        await rootBundle.load(path);
        _existingAssets.add(path);
      } catch (_) {
        // Skip missing assets; user may add later
      }
    }

    if (_existingAssets.isEmpty) {
      setState(() {
        _isInitializing = false;
      });
      return;
    }

    final startIndex = _normalizedIndex(widget.index) ?? 0;
    await _initializeControllerForIndex(startIndex);
  }

  int? _normalizedIndex(int? i) {
    if (i == null) return null;
    if (_existingAssets.isEmpty) return null;
    final len = _existingAssets.length;
    if (i < 0) return 0;
    if (i >= len) return len - 1;
    return i;
  }

  Future<void> _initializeControllerForIndex(int index) async {
    _controller?.removeListener(_onTick);
    await _controller?.dispose();

    final controller = VideoPlayerController.asset(_existingAssets[index]);
    _controller = controller;

    await controller.initialize();
    await controller.setVolume(0.0);
    await controller.setLooping(widget.index != null && widget.loopSingle);
    controller.addListener(_onTick);

    setState(() {
      _currentIndex = index;
      _isInitializing = false;
    });

    await controller.play();
  }

  void _onTick() {
    final controller = _controller;
    if (controller == null) return;
    final value = controller.value;
    if (!value.isInitialized) return;
    // If looping a single provided index, no need to advance
    if (widget.index != null && widget.loopSingle) return;
    if (!value.isPlaying && value.position >= value.duration) {
      _playNext();
    }
  }

  Future<void> _playNext() async {
    if (_existingAssets.isEmpty) return;
    final nextIndex = (_currentIndex + 1) % _existingAssets.length;
    await _initializeControllerForIndex(nextIndex);
  }

  @override
  void dispose() {
    _controller?.removeListener(_onTick);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitializing) {
      return const SizedBox.shrink();
    }
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Center(child: Text('No videos found in assets/videos/'));
    }

    // Use proper aspect ratio to maintain video proportions without stretching
    return Center(
      child: AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      ),
    );
  }
}
