Template.job_list.helpers ( 
  jobs : -> Jobs.find({taken_by:{$exists:false}}, { sort: { name: 1 }}).fetch()
)

Template.job.helpers (
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