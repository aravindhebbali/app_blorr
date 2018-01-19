link_test <- function(model) {
  
  dat <- model %>%
    use_series(data) 
  
  fit <- model %>%
    predict.glm(newdata = dat)
  
  fit2 <- fit %>%
    raise_to_power(2)
  
  resp <- model %>%
    use_series(y)
  
  newdat <- tibble(fit = fit, fit2 = fit2, resp = resp)
  
  glm(resp ~ fit + fit2, data = newdat,
      family = binomial(link = 'logit')) %>%
    summary
  
}
