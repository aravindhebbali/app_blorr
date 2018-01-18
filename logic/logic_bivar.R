observe({
	updateSelectInput(session, inputId = "resp_bivar",
    choices = names(final_split$train))
	updateSelectInput(session, inputId = "var_bivar",
    choices = names(final_split$train))
})

bivar <- eventReactive(input$submit_bivar, {
	blorr::blr_bivariate_analysis(data = final_split$train,
		response = input$resp_bivar, input$var_bivar)
})

output$bivar_out <- renderPrint({
	bivar()
})