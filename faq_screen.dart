import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faqs = [
    FAQ(question: "I haven’t received my withdrawal money, what should I do?", answer: "Relax, we’re here for you, usually, money withdrawals happens immediately but sometimes there may be delay."),
    FAQ(question: "I can’t see my added money, what should I do?", answer: "Please check your transaction history to see if the money has been added. If not, contact support."),
    FAQ(question: "I want to withdraw, how do I verify?", answer: "To verify for withdrawal, go to the verification section and upload the necessary documents."),
    FAQ(question: "I haven’t received my withdrawal money, what should I do?", answer: "Relax, we’re here for you, usually, money withdrawals happens immediately but sometimes there may be delay."),
    FAQ(question: "I haven’t received my withdrawal money, what should I do?", answer: "Relax, we’re here for you, usually, money withdrawals happens immediately but sometimes there may be delay."),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF7775F8), // Updated background color
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent, // Make Scaffold background transparent
          appBar: AppBar(
            backgroundColor: const Color(0xFF7775F8), // Updated background color
            title: const Text('FAQ'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          body: Container(
            color: const Color(0xFF7775F8), // Updated background color for entire body
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/banner.jpg'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Hi, Lockie',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'How can we help you today?',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Most asked questions',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ...faqs.map((faq) => FAQTile(faq: faq)).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

class FAQTile extends StatelessWidget {
  final FAQ faq;

  FAQTile({required this.faq});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(faq.question),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            faq.question,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(faq.answer),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text('Was this helpful?'),
                        Spacer(),
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thank you for your feedback!')));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('We will work on improving this answer.')));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
