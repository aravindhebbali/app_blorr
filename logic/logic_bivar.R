observe({

	updateSelectInput(session, inputId = "resp_bivar",
    choices = names(final_split$train))
	updateSelectInput(session, inputId = "var_bivar",
    choices = names(final_split$train))

	updateSelectInput(session, inputId = "resp_woe",
    choices = names(final_split$train))
	updateSelectInput(session, inputId = "var_woe",
    choices = names(final_split$train))

	updateSelectInput(session, inputId = "resp_woe2",
    choices = names(final_split$train))
	updateSelectInput(session, inputId = "var_woe2",
    choices = names(final_split$train))

})

bivar <- eventReactive(input$submit_bivar, {
	blorr::blr_bivariate_analysis(data = final_split$train,
		response = input$resp_bivar, input$var_bivar)
})

woe_iv <- eventReactive(input$submit_woe, {
	blorr::blr_woe_iv(data = final_split$train,
		predictor = input$var_woe, response = input$resp_woe)
})

woe_iv_2 <- eventReactive(input$submit_woe2, {
	blorr::blr_woe_iv_stats(data = final_split$train,
		response = input$resp_woe2, input$var_woe2)
})

output$bivar_out <- renderPrint({
	bivar()
})

output$woe_out <- renderPrint({
	woe_iv()
})

output$woe2_out <- renderPrint({
	woe_iv_2()
})