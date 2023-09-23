require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT;

// Middleware to parse JSON requests
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send('Hello World!');
})
// Define a POST route for sending user input to AI21
app.post('/generate', async (req, res) => {
  try {
    // Get the user's input from the request body
    const userInput = req.body.input;
    const apiKey = process.env.api_key;
    // Make a POST request to AI21
    const response = await fetch("https://api.ai21.com/studio/v1/j2-ultra/complete", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${apiKey}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        "prompt": userInput, // Use user's input as the prompt
        "numResults": 1,
        "epoch": 0,
        "maxTokens": 200,
        "temperature": 0.7,
        "topKReturn": 0,
        "topP": 1,
        "presencePenalty": {
          "scale": 0,
          "applyToNumbers": true,
          "applyToPunctuations": true,
          "applyToStopwords": true,
          "applyToWhitespaces": true,
          "applyToEmojis": true
        },
        "countPenalty": {
          "scale": 0,
          "applyToNumbers": true,
          "applyToPunctuations": true,
          "applyToStopwords": true,
          "applyToWhitespaces": true,
          "applyToEmojis": true
        },
        "frequencyPenalty": {
          "scale": 0,
          "applyToNumbers": true,
          "applyToPunctuations": true,
          "applyToStopwords": true,
          "applyToWhitespaces": true,
          "applyToEmojis": true
        },
        "stopSequences": []
      })
    });

    // Parse the response from AI21
    const responseData = await response.json();
    const text = responseData["completions"][0]["data"]["text"];

    // Send the AI-generated response back to the user
    res.json({ response: text });
    console.log(text);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Start the Express server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
