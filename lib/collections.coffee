Jobs = new Mongo.Collection("jobs")

Schemas = {}

Schemas.Job = new SimpleSchema(
  job_title:
    type: String
    label: 'Job Title'
    max: 30
  job_description:
    type: String
    label: 'Description'
    max: 300
  job_reward:
    type: Number
    label: 'Price (max $1000)'
    max: 1000
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


