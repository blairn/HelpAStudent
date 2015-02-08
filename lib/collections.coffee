Jobs = new Mongo.Collection("jobs")

Schemas = {}

Schemas.UserProfile = new SimpleSchema(
  firstName:
    type: String
    regEx: /^[a-zA-Z-]{2,25}$/
    optional: true
  lastName:
    type: String
    regEx: /^[a-zA-Z]{2,25}$/
    optional: true
  birthday:
    type: Date
    optional: true
  gender:
    type: String
    allowedValues: [
      'Male'
      'Female'
    ]
    optional: true
  organization:
    type: String
    regEx: /^[a-z0-9A-z .]{3,30}$/
    optional: true
  website:
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true
  bio:
    type: String
    optional: true
)

Schemas.User = new SimpleSchema(
  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true
  emails:
    autoform:
      omit: true
    type: [ Object ]
    optional: true
  'emails.$.address':
    type: String
    regEx: SimpleSchema.RegEx.Email
  'emails.$.verified': type: Boolean
  createdAt: 
    type: Date
    autoform:
      omit: true

  profile:
    type: Schemas.UserProfile
    optional: true
  services:
    autoform:
      omit: true
    type: Object
    optional: true
    blackbox: true
  roles:
    autoform:
      omit: true
    type: Object
    optional: true
    blackbox: true
)

Meteor.users.attachSchema Schemas.User

Schemas.Job = new SimpleSchema(
  job_title:
    type: String
    label: 'Job Title'
    max: 50
  job_description:
    type: String
    label: 'Description'
    max: 300
  job_reward:
    type: Number
    label: 'Price (max $1000)'
    max: 1000
  category:
    type: String
    allowedValues: ['study', 'moving', 'cleaning', 'baby', 'other']
    autoform:
      options:
        study: 'study help'
        moving: 'moving house'
        cleaning: 'cleaning'
        baby: 'baby sitting'
        other: 'other'      
  job_date:
    type: Date
    label: 'Date'
    optional: true
  taken_by:
    type: String
    regEx: SimpleSchema.RegEx.Id
    optional: true
    autoform:
      omit: true
  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    defaultValue: -> @userId
    autoform:
      omit: true
#      options: ->
#        _.map Meteor.users.find().fetch(), (user)->
#          label: user.emails[0].address
#          value: user._id
)

Jobs.attachSchema Schemas.Job

#Jobs.allow(
#  insert: (userId, doc) -> userId && doc.owner == userId
#  remove: (userId, doc) -> doc.owner == userId
#  update: (userId, doc) -> doc.owner == userId
#  fetch: ['owner']
#)
#
#Jobs.deny(
#  insert: (userId, doc) -> doc.name.trim() == ''
#  update: (userId, doc, fields) -> _.contains(fields, 'owner') && doc.name.trim() == ''
#)
#
#Jobs.find({}).observe(
#  removed: (doc) -> Jobs.remove({topics_id: doc._id})
#)

root = exports ? this

root.Jobs = Jobs


