source('helpers/model-fit-stats.R')

model <- eventReactive(input$submit_regress, {
  data <- final_split$train
  k <- glm(input$regress_fmla, data = data, family = binomial(link = "logit"))
  k
})

d_regress <- eventReactive(input$submit_regress, {
  data <- final_split$train
  k <- blr_regress(input$regress_fmla, data = data)
  k
})

r1_title <- eventReactive(input$submit_regress, {
  column(12, align = 'center', h4('Regression Result'))
})

output$reg1_title <- renderUI({
  r1_title()
})

output$regress_out <- renderPrint({
    d_regress()
})


# model fit statistics
result <- eventReactive(input$submit_mfs, {
  if (input$mfs_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$mfs_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_model_fit_stats(k))
})

output$mfs <- renderPrint({
  result()
})
