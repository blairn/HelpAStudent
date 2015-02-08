Router.configure layoutTemplate: 'layout'

Router.route '/', -> @render('home')
Router.route '/create_job', -> @render('create_job')
Router.route '/browse_jobs', -> @render('browse_jobs')

#Render the job page
Router.route '/job_page/:_id', -> @render('job_page', {data: Jobs.find(@params._id).fetch()})