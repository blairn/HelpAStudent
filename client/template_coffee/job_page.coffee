Template.job_page.helpers(
  taken_by_you: -> @taken_by == Meteor.user()._id
  icon : -> 
    switch @category
      when 'baby' then 'child'
      when 'study' then 'book'
      when 'moving' then 'truck'
      when 'cleaning' then 'trash'
      else 'other'
  category_description : ->
    switch @category
      when 'baby' then 'baby sitting'
      when 'study' then 'help with studying'
      when 'moving' then 'help moving house'
      when 'cleaning' then 'cleaning'
      else 'other'
    
)

Template.job_page.events(
  'click #take_job': -> Jobs.update(@_id, {$set: {taken_by: Meteor.userId()}})
)