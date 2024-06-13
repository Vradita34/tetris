import 'package:flutter/material.dart';
import 'board.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int? _lastScore;
  bool _isGameStarted = false;

  void _startGame() {
    setState(() {
      _isGameStarted = true;
    });
  }

  void _endGame(int score) {
    setState(() {
      _lastScore = score;
      _isGameStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tetris Game'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: _isGameStarted
            ? GameBoard(onGameOver: _endGame)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tetris Game',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 179, 0,
                            255), // Pastikan teks terlihat di atas gambar
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _startGame,
                      child: const Text('Get Started'),
                    ),
                    if (_lastScore != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        'Last Score: $_lastScore',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 0,
                              170), // Pastikan teks terlihat di atas gambar
                        ),
                      ),
                    ]
                  ],
                ),
              ),
      ),
    );
  }
}
