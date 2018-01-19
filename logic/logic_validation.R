source('helpers/model-validation.R')

conf_result <- eventReactive(input$submit_conf, {
  if (input$conf_use_prev) {
    k <- model()
  } else {
    data <- final_split$train
    k <- glm(input$conf_fmla, data = data, family = binomial(link = "logit"))
  }
  return(blr_confusion_matrix(k, cutoff = input$conf_cutoff))
})

confusion_title <- eventReactive(input$submit_conf, {
  column(12, align = 'center', h4('Confusion Matrix & Model Performance Measures'))
})

output$conf_title <- renderUI({
  confusion_title()
})


output$conf_out <- renderPrint({
  conf_result()
})

