Template.jobs.helpers ( 
  jobs : -> Jobs.find({}, { sort: { name: 1 }}).fetch()
)