Meteor.startup(->
  if (Jobs.find().count() == 0)
    test = Accounts.createUser(
      username: 'Test'
      email: 'test@test.com'
      password: 'test'
      profile:
        firstName:'testy'
        lastName:'tester'
    )

    emily = Accounts.createUser(
      username: 'Emily'
      email: 'emily@test.com'
      password: 'test'
      profile:
        firstName:'Emily'
        lastName:'Winter'
    )

    gabe = Accounts.createUser(
      username: 'Gabe'
      email: 'gabe@test.com'
      password: 'test'
      profile:
        firstName:'gabe'
        lastName:'chaos'
    )

    john = Accounts.createUser(
      username: 'John'
      email: 'john@test.com'
      password: 'test'
      profile:
        firstName:'John'
        lastName:'Walker'
    )

    andy = Accounts.createUser(
      username: 'Andy'
      email: 'andy@test.com'
      password: 'test'
      profile:
        firstName:'Andy'
        lastName:'Smith'
    )

    Jobs.insert
      job_title: 'Math 203 assignment 2'
      job_description: 'I need help with the Math 203 assignment 2, will pay in beer (6 pack - craft)'
      job_reward: 0
      job_poster: 'Emily'
      category: 'study'
      owner: emily

    Jobs.insert
      job_title: 'baby sitting'
      job_description: 'Hey, me and my bf would like a night out, we are looking for a baby sitter for Gabe (5 years old) for the evening, grab food from the fridge, have netflicks'
      job_reward: 20
      job_poster: 'Emily'
      category: 'baby'
      owner: emily

    Jobs.insert
      job_title: 'my car is broken!'
      job_description: 'Anyone know how to fix a car? The battery keep dieing, and there was smoke coming from the generator'
      job_reward: 50
      job_poster: 'John'
      category: 'other'
      owner: john
      
    Jobs.insert
      job_title: 'I am moving, need help cleaning!'
      job_description: 'My old flatemates were pigs, and have left, please help me get something back from my bond!!!'
      job_reward: 50
      job_poster: 'Andy'
      category: 'cleaning'
      owner: andy

    Jobs.insert
      job_title: 'I am moving need help!'
      job_description: "I have a bed, and fridge which I need to move, my car is broken, and I don't have a toe bar, please help" 
      job_reward: 50
      job_poster: 'Andy'
      category: 'moving'
      owner: andy
      
)