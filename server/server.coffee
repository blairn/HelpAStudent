Meteor.startup(->
  if (Jobs.find().count() == 0)
    jobs = ['Test Job One', 'Test Job Two', 'Test Job Three', 'Test Job Four', 'Test Job Five']
    for job in jobs
      Jobs.insert
        job_title: job
        job_description: 'This is a test description for testing the styling of the jobs on the browse page'
        job_reward: Math.floor(Random.fraction() * 10) * 5
        job_poster: 'Admin Tester'
)