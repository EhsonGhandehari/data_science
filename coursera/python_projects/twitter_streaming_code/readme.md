About twitterstream.py: Used to fetch live stream data from twitter. Requires oauth2, which is not part of the EnThought Python library. usage: Open the program and replace access_token_key, access_token_secret, consumer_key, and consumer_secret with the appropriate values. Then run $ python twitterstream.py To get credentials:

1.  Create a twitter account if you do not already have one.
2.  Go to [**https://dev.twitter.com/apps**](https://dev.twitter.com/apps) and log in with your twitter credentials.
3.  Click "Create New App"
4.  Fill out the form and agree to the terms. Put in a dummy website if you don't have one you want to use.
5.  On the next page, click the "API Keys" tab along the top, then scroll all the way down until you see the section "Your Access Token"
6.  Click the button "Create My Access Token". You can [**Read more about Oauth authorization.**](https://dev.twitter.com/docs/auth)
7.  You will now copy four values into twitterstream.py. These values are your "API Key", your "API secret", your "Access token" and your "Access token secret". All four should now be visible on the API Keys page. (You may see "API Key" referred to as "Consumer key" in some places in the code or on the web; they are synonyms.) Open twitterstream.py and set the variables corresponding to the api key, api secret, access token, and access secret. You will see code like the below:

    <pre>api_key = "<Enter api key>"
    api_secret = "<Enter api secret>"
    access_token_key = "<Enter your access token key here>"
    access_token_secret = "<Enter your access token secret here>"
    </pre>

8.  Run the following and make sure you see data flowing and that no errors occur.

    <pre>$ python twitterstream.py > output.txt</pre>

    This command pipes the output to a file. Stop the program with Ctrl-C, but wait at least **3 minutes** for data to accumulate. Keep the file output.txt for the duration of the assignment; we will be reusing it in later problems. Don’t use someone else’s file; we will check for uniqueness in other parts of the assignment.