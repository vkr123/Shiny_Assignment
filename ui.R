library(shiny)
shinyUI(fluidPage(
    titlePanel("Prediction Of Species based on the Sepal dimensions"),
    sidebarLayout(
        sidebarPanel(
            h3("Documentaion"),
            p("1) The below sliders can be used to vary the length and width of the sepal which will inturn predict the species for the given dimensions."),
            p("2) The checkbox can be selected/deselected to show or hide the boxplot."),
            p("3) The final prediction value - Species can be seen at the right bottom."),
            p("4) Click the submit button to see the results"),
            sliderInput("sep_len", "What is the length of the sepal?", 3, 8, value = 5),
            sliderInput("sep_wid", "What is the width of the sepal?", 1, 7, value = 3),
            checkboxInput("show_model1", "Show/Remove Box Plot Species vs Sepal Width", value = TRUE),
            checkboxInput("show_model2", "Show/Remove Box Plot Species vs Sepal Length", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plotlm"),
            h3("Predicted Species from the Sepal Dimension:"),
            textOutput("prediction"),
        )
    )
))