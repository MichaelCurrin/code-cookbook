# Tweets

A feed of tweets.


## Sample

Based on this [CodePen](https://codepen.io/jcfleetcomplete/pen/dyNOjoe). 

I found tht because it uses PrimeVue, though its `paginator` setup does nothing so I am just interested in the Vue part after doing my cleanup.

- `index.html`
    ```
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Tweets demo</title>

        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.2/css/bulma.min.css"
            rel="stylesheet" />

        <link href="styles.css" rel="stylesheet">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.min.js" ;></script>

        <script type="module" src="main.js" defer></script>
    </head>

    <body>
        <div id="app" class="columns">
            <div class="column">
                <tweet-component v-for="tweet in tweets" :tweet="tweet" @do-test="updateTest" />
            </div>
        </div>
    </body>

    </html>
    ```
- `main.js`
    ```javascript
    const tweets = [
      {
        id: 1,
        name: "Matthew",
        handle: "@matthew",
        img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
        tweet: "I love Vue.",
        likes: 10,
      },
      {
        id: 2,
        name: "Molly",
        handle: "@molly",
        img: "https://semantic-ui.com/images/avatar2/large/molly.png",
        tweet: "Let's learn JS together",
        likes: 12,
      },
      {
        id: 3,
        name: "Elyse",
        handle: "@elyse",
        img: "https://semantic-ui.com/images/avatar2/large/elyse.png",
        tweet: "What even is styling?",
        likes: 18,
      },
    ];

    Vue.component("tweet-component", {
      props: {
        tweet: Object,
      },
      methods: {
        test(tweet) {
          console.log("test");
          this.$emit("do-test", event, tweet);
        },
      },
      template: `
      <div class="tweet" @click="test(tweet)">
        <div class="box">
          <article class="media">
            <div class="media-left">
              <figure class="image is-64x64">
                <img :src="tweet.img" alt="Image">
              </figure>
            </div>

            <div class="media-content">
              <div class="content">
                <p>
                  <strong>{{tweet.name}}</strong> <small>{{tweet.handle}}</small>
                  <br>
                  {{tweet.tweet}}
                </p>
              </div>
                <div class="level-left">
                  <a class="level-item">
                    <span class="icon is-small"><i class="fas fa-heart"></i></span>
                    <span class="likes">{{tweet.likes}}</span>
                  </a>
                </div>
            </div>
          </article>
        </div>
      </div>
    `,
    });

    new Vue({
      el: "#app",
      data() {
        return {
          tweets,
        };
      },
      methods: {
        updateTest(event, tweet) {
          console.log("event", event);
          console.log("tweet", tweet);
        },
      },
    });
    ```
- `styles.css`
    ```css
    html,
    body {
      height: 100%;
      padding-top: 10px;
      background: #e6ecf1;
    }

    #app {
      height: 100%;
      padding-top: 0px;
      text-align: center;
    }

    #app .button {
      margin-bottom: 20px;
    }

    #app .tweet {
      max-width: 500px;
      margin: 0 auto;
      padding-bottom: 15px;
    }

    #app .box {
      margin-bottom: 0;
      border-radius: 0;
    }

    #app .content small {
      color: #00d1b2;
    }

    #app img {
      border-radius: 30px;
    }

    #app .level-item {
      padding-left: 10px;
      color: #00d1b2;
    }

    #app input:focus {
      border-color: #00d1b2;
    }

    #app .likes {
      padding: 0 7.5px;
    }

    #app input {
      font-weight: bold;
    }

    #app .tweets-move {
      transition: transform 1s;
    }
    ```
    
