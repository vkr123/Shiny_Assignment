library(shiny)

shinyServer(function(input, output) {
    model = lm(as.numeric(Species) ~ Sepal.Length + Sepal.Width, data = iris)
    
    model_pred = reactive({
        iris_sl = input$sep_len
        iris_sw = input$sep_wid
        nd = data.frame(Sepal.Length = iris_sl,Sepal.Width = iris_sw)
        final = predict(model, newdata = nd)
        if(final<1.5){
            ans = "setosa"
            ans
        }
        if(final<2.5 & final>=1.5){
            ans = "versicolour"
            ans
        }
        else
            ans = "virginica"
            ans
    })
    
    output$plotlm = renderPlot({
        iris_sl = input$sep_len
        iris_sw = input$sep_wid
        par(mfrow=c(1,2))
        if(input$show_model1){
        plot(iris$Species, iris$Sepal.Width, xlab = "Sepal Width", 
             ylab = "Species", bty = "n", pch = 20, bg = 23, col = "red", main = "Species vs Sepal Width")
        grid()
        }
        if(input$show_model2){
        plot(iris$Species, iris$Sepal.Length, xlab = "Sepal Length", 
             ylab = "Species", bty = "n", pch = 20, bg = 23, col = "green", main = "Species vs Sepal Length")
        grid()
        }
    })
    output$prediction <- renderText({
        model_pred()
    })
    
})
