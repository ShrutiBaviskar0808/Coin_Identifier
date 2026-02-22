import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Learn & Explore', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDailyQuizCard(context),
          const SizedBox(height: 20),
          _buildTerminologyCard(context),
          const SizedBox(height: 20),
          Text('Explore Categories', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 16),
          _buildCategoryCard(context, 'Ancient Coins', 'Discover coins from ancient civilizations', Icons.history_edu, 'ancient'),
          _buildCategoryCard(context, 'Gold Coins', 'Explore valuable gold coin collections', Icons.monetization_on, 'gold'),
          _buildCategoryCard(context, 'Rare Coins', 'Learn about the rarest coins in history', Icons.diamond, 'rare'),
          _buildCategoryCard(context, 'Error Coins', 'Fascinating minting mistakes and errors', Icons.error_outline, 'error'),
          _buildCategoryCard(context, 'Most Expensive Coins', 'The world\'s most valuable coins', Icons.attach_money, 'expensive'),
        ],
      ),
    );
  }

  Widget _buildDailyQuizCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.quiz, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Coin Quiz', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Test your knowledge!', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.gold, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Text('Start', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildTerminologyCard(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TerminologyScreen())),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
              child: Icon(Icons.book, color: AppColors.gold, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Coin Terminology', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  Text('Learn numismatic terms', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.gold, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String description, IconData icon, String category) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryDetailScreen(category: category, title: title))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: AppColors.gold, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                  Text(description, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.textGray, size: 16),
          ],
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String category;
  final String title;

  const CategoryDetailScreen({super.key, required this.category, required this.title});

  @override
  Widget build(BuildContext context) {
    final items = _getCategoryItems();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.white, elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) => _buildCoinItem(context, items[index]),
      ),
    );
  }

  List<Map<String, String>> _getCategoryItems() {
    final data = {
      'ancient': [
        {'title': 'Roman Denarius', 'desc': 'Silver coin of ancient Rome, used for over 400 years', 'image': '🏛️'},
        {'title': 'Greek Drachma', 'desc': 'Ancient Greek currency dating back to 5th century BC', 'image': '🏺'},
        {'title': 'Byzantine Solidus', 'desc': 'Gold coin of the Byzantine Empire', 'image': '👑'},
      ],
      'gold': [
        {'title': 'American Gold Eagle', 'desc': 'Official gold bullion coin of the United States', 'image': '🦅'},
        {'title': 'Canadian Gold Maple Leaf', 'desc': 'One of the purest gold coins in the world', 'image': '🍁'},
        {'title': 'South African Krugerrand', 'desc': 'First modern gold bullion coin', 'image': '🌍'},
      ],
      'rare': [
        {'title': '1933 Double Eagle', 'desc': 'One of the most valuable coins ever sold', 'image': '💎'},
        {'title': '1794 Flowing Hair Dollar', 'desc': 'First dollar coin issued by US federal government', 'image': '💵'},
        {'title': 'Edward III Florin', 'desc': 'Medieval English gold coin, only 3 known to exist', 'image': '👑'},
      ],
      'error': [
        {'title': 'Double Strike Error', 'desc': 'Coin struck twice by the die, creating doubled image', 'image': '⚠️'},
        {'title': 'Off-Center Strike', 'desc': 'Misaligned striking creates unique appearance', 'image': '🎯'},
        {'title': 'Wrong Planchet Error', 'desc': 'Coin struck on wrong metal blank', 'image': '🔄'},
      ],
      'expensive': [
        {'title': '1794 Flowing Hair Dollar', 'desc': 'Sold for \$10 million in 2013', 'image': '💰'},
        {'title': '1933 Double Eagle', 'desc': 'Sold for \$18.9 million in 2021', 'image': '🏆'},
        {'title': 'Brasher Doubloon', 'desc': 'Sold for \$9.36 million in 2021', 'image': '⭐'},
      ],
    };
    return data[category] ?? [];
  }

  Widget _buildCoinItem(BuildContext context, Map<String, String> item) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleScreen(title: item['title']!, description: item['desc']!))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text(item['image']!, style: const TextStyle(fontSize: 32))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title']!, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                  const SizedBox(height: 4),
                  Text(item['desc']!, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.textGray, size: 16),
          ],
        ),
      ),
    );
  }
}

class ArticleScreen extends StatelessWidget {
  final String title;
  final String description;

  const ArticleScreen({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Icon(Icons.image, size: 80, color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Text(title, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 12),
            Text(description, style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textGray, height: 1.6)),
            const SizedBox(height: 20),
            Text('Full article content would be displayed here with detailed information, history, and interesting facts about $title.', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray, height: 1.8)),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswer;

  final _questions = [
    {'q': 'What is the study of coins called?', 'options': ['Philately', 'Numismatics', 'Cartography', 'Archaeology'], 'correct': 1},
    {'q': 'Which country created the first gold coin?', 'options': ['Greece', 'Rome', 'Lydia', 'Egypt'], 'correct': 2},
    {'q': 'What does "mint condition" mean?', 'options': ['Green colored', 'Perfect condition', 'Made of mint', 'Old coin'], 'correct': 1},
  ];

  void _answerQuestion(int index) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = index;
      _answered = true;
      if (index == _questions[_currentQuestion]['correct']) _score++;
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _answered = false;
        _selectedAnswer = null;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Complete!', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text('Your score: $_score/${_questions.length}', style: GoogleFonts.poppins(fontSize: 18)),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst), child: Text('Done', style: GoogleFonts.poppins(color: AppColors.gold))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('Daily Quiz', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.white, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(value: (_currentQuestion + 1) / _questions.length, backgroundColor: Colors.grey.shade200, color: AppColors.gold),
            const SizedBox(height: 20),
            Text('Question ${_currentQuestion + 1}/${_questions.length}', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray)),
            const SizedBox(height: 12),
            Text(question['q'] as String, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 24),
            ...(question['options'] as List<String>).asMap().entries.map((entry) {
              final isCorrect = entry.key == question['correct'];
              final isSelected = entry.key == _selectedAnswer;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(entry.key),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answered ? (isCorrect ? Colors.green : isSelected ? Colors.red : Colors.white) : Colors.white,
                    foregroundColor: _answered && (isCorrect || isSelected) ? Colors.white : AppColors.textDark,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(entry.value, style: GoogleFonts.poppins(fontSize: 16)),
                ),
              );
            }),
            const Spacer(),
            if (_answered)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: Text(_currentQuestion < _questions.length - 1 ? 'Next Question' : 'Finish Quiz', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}

class TerminologyScreen extends StatelessWidget {
  const TerminologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final terms = [
      {'term': 'Numismatics', 'def': 'The study or collection of currency, including coins, tokens, and paper money'},
      {'term': 'Obverse', 'def': 'The front or "heads" side of a coin'},
      {'term': 'Reverse', 'def': 'The back or "tails" side of a coin'},
      {'term': 'Mint Mark', 'def': 'A small letter or symbol indicating where a coin was produced'},
      {'term': 'Patina', 'def': 'The natural toning or discoloration that develops on a coin over time'},
      {'term': 'Proof', 'def': 'A specially made coin with mirror-like surfaces and frosted designs'},
      {'term': 'Bullion', 'def': 'Coins valued primarily for their precious metal content'},
      {'term': 'Grade', 'def': 'The condition rating of a coin, typically on a scale from 1 to 70'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('Coin Terminology', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.white, elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: terms.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(terms[index]['term']!, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gold)),
              const SizedBox(height: 8),
              Text(terms[index]['def']!, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}
