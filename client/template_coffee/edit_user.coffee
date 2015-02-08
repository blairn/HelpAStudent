Template.edit_user.helpers (
  user: -> Meteor.user()
)

Template.jobs_posted.helpers (
  jobs: -> Jobs.find({owner:Meteor.user()._id}, { sort: { name: 1 }}).fetch()
)

Template.jobs_taken.helpers (
  jobs: -> Jobs.find({taken_by:Meteor.user()._id}, { sort: { name: 1 }}).fetch()
)
