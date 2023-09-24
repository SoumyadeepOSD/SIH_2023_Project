import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_2023/Frontend/states/generalState.dart';
import '../constant/colors.dart';
import '../constant/widgets.dart';

TextEditingController userInputController = TextEditingController();
List<ChatMessage> chatMessages = [];
String responseText = '';

class PersonalAssistant extends StatefulWidget {
  const PersonalAssistant({super.key});

  @override
  State<PersonalAssistant> createState() => _PersonalAssistantState();
}

class _PersonalAssistantState extends State<PersonalAssistant> {
  @override
  Widget build(BuildContext context) {
    Future<void> fetchAIResponse() async {
      try {
        final apiKey =
            '6JogrtXhrnnv6eGl6WVEsNYY5Hkx97Gu'; // Replace with your API key
        final userInput = userInputController.text;

        final response = await http.post(
          Uri.parse('https://api.ai21.com/studio/v1/j2-ultra/complete'),
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'prompt': userInput,
            'numResults': 1,
            'epoch': 0,
            'maxTokens': 200,
            'temperature': 0.7,
            'topKReturn': 0,
            'topP': 1,
            'presencePenalty': {
              'scale': 0,
              'applyToNumbers': true,
              'applyToPunctuations': true,
              'applyToStopwords': true,
              'applyToWhitespaces': true,
              'applyToEmojis': true,
            },
            'countPenalty': {
              'scale': 0,
              'applyToNumbers': true,
              'applyToPunctuations': true,
              'applyToStopwords': true,
              'applyToWhitespaces': true,
              'applyToEmojis': true,
            },
            'frequencyPenalty': {
              'scale': 0,
              'applyToNumbers': true,
              'applyToPunctuations': true,
              'applyToStopwords': true,
              'applyToWhitespaces': true,
              'applyToEmojis': true,
            },
            'stopSequences': [],
          }),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final text = responseData['completions'][0]['data']['text'];

          setState(() {
            chatMessages.add(ChatMessage(userInput, true));
            chatMessages.add(ChatMessage(text, false));
            responseText = text;
          });
          print(text);
        } else {
          throw Exception('Failed to fetch data');
        }
      } catch (error) {
        print(error);
        setState(() {
          responseText = 'Internal Server Error';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Chat Support",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Consumer<GeneralStateProvider>(
        builder: (context, providervalue, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatMessages[index];
                  return ListTile(
                    tileColor: message.isSender
                        ? Colors.orange.shade300
                        : Colors.green.shade500,
                    title: customTextWidget(
                        message.isSender
                            ? providervalue.userFName.toString()
                            : 'Disha',
                        16.0,
                        FontWeight.bold,
                        black),
                    subtitle: customTextWidget(
                        message.text, 14.0, FontWeight.bold, white),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: userInputController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.yellowAccent,
                  hintText: "Type your queries...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                fetchAIResponse();
                userInputController.clear();
              },
              child: Text('Generate Response'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSender;
  ChatMessage(this.text, this.isSender);
}
