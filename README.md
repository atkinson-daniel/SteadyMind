# SteadyMind
![SteadyMind](https://user-images.githubusercontent.com/50503353/83813815-5e35e500-a67b-11ea-9023-b2ad4c0c141f.png)

## About Our App

SteadyMind is a mental health and wellbeing tracking application. Everyday, you will be prompted to log how you are feeling that day. You can simply react with the provided emojis, or you can add a comment to explain what has contributed to your mood. Our app also includes the following additional features: 
- A statistics page which renders a graph to show how your mood has been trending over time. 
- A calendar to quickly see what your mood was during a particular day, week, or month. 
- A suggested resources page which will provide yoga, meditation, and motivational videos to either get you out of your slump, or to keep you in an already happy mood. 
- An all resources page so the user can access all YouTube videos from the SteadyMind YouTube Channel. We've also provided external resources if you'd like to find a nearby therapist and yoga classes. 

This application was created by the following Turing students: [Daniel Atkinson](https://github.com/danielbldr), [Javier Aguilar](https://github.com/javier-aguilar), [Steven Meyers](https://github.com/SMJ289), and [Travis Borgsmiller](https://github.com/TravisBorgsmiller)

**View our app in production at [steadymind.herokuapp.com](https://steadymind.herokuapp.com/)**

### Local Installation 
```
$ git clone git@github.com:danielbldr/SteadyMind.git   
$ cd SteadyMind 
$ gem install bundler   
$ bundle   
$ rails db:{drop,create,migrate,seed}   
$ bundle exec figaro install  
```

We created a Sinatra application which acts as a microservice to handle API calls to YouTube. Follow set up instructions [here](https://github.com/danielbldr/SteadyMindMS)

### Technologies Used
- Rails 5.1.7
- Ruby 2.5.3

### APIs Consumed
- [ZenQuotes.io](https://zenquotes.io/)
- [SteadyMindMS](https://github.com/danielbldr/SteadyMindMS)

## Environment Setup:
SteadyMind consumes the ZenQuotes API and used Google as our OAUth provider. In order to run in development, you will need to set up your environment variables.

##### You will need the following:
Google OAuth Client ID and Client Secret: [Google API Key](https://developers.google.com/identity/sign-in/web/sign-in)

> To test in development, set the Authorization callback URL to `http://localhost:3000/auth/google_oauth2/callback`

Add the following environment variables to your `config/application.yml` file.

```
GOOGLE_CLIENT_ID: <YOUR GOOGLE CLIENT ID>  
GOOGLE_CLIENT_SECRET: <YOUR GOOGLE CLIENT SECRET>  
```

## Tests
Run `bundle exec rspec` to run the test suite. Make sure you are connected to the internet and you set up your environmental variables correctly. 

## Development
To run SteadyMind in development, run `rails s` and visit `http://localhost:3000`

## The Future of SteadyMind
- Add weekly goals. This can be setting a goal to drink 8 classes of water a day, to going to the gym 3 days a week.
- Allow user to see historic diary entries 
- Build an in-app breathing and meditation guide
