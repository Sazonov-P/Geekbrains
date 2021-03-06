# install azure-ai-textanalytics (version 3)
# import libraries
from azure.ai.textanalytics import TextAnalyticsClient
from azure.core.credentials import AzureKeyCredential

# my security information
key = '****'
endpoint = "https://xahma.cognitiveservices.azure.com/"

# the process of my authentication
def authenticate_client():
    ta_credential = AzureKeyCredential(key)
    text_analytics_client = TextAnalyticsClient(
            endpoint=endpoint, credential=ta_credential)
    return text_analytics_client

client = authenticate_client()

# Sentiment analysis
def sentiment_analysis_example(client):
    documents = ["""Justin Trudeau, once again, simply doesn’t get it;
The PM has no clue why there was an issue awarding a $912-million, 
sole-sourced contract to an organization that he has been closely linked to over the years.
“No I didn’t,” Trudeau said when asked whether he had recused himself from the decision to award WE the contract.
That leads to the obvious follow-up question of why not? He didn’t actually give an answer.
“I have long worked on youth issues, both before I got into politics and since I’ve been in politics, 
as youth critic,” Trudeau said as if that somehow excused his decision to involve himself in this. 
He then went on about the importance of youth across Canada “serving their country."""]
    response = client.analyze_sentiment(documents=documents)[0]
    print("Document Sentiment: {}".format(response.sentiment))
    print("Overall scores: positive={0:.2f}; neutral={1:.2f}; negative={2:.2f} \n".format(
        response.confidence_scores.positive,
        response.confidence_scores.neutral,
        response.confidence_scores.negative,
    ))
    for idx, sentence in enumerate(response.sentences):
        print("Sentence: {}".format(sentence.text))
        print("Sentence {} sentiment: {}".format(idx + 1, sentence.sentiment))
        print("Sentence score:\nPositive={0:.2f}\nNeutral={1:.2f}\nNegative={2:.2f}\n".format(
            sentence.confidence_scores.positive,
            sentence.confidence_scores.neutral,
            sentence.confidence_scores.negative,
        ))

sentiment_analysis_example(client)

