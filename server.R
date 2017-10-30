server <- function(input, output) {
  
  data1 <-eventReactive(input$Compute1, { 
    inFile1 <- input$file1 
    if (is.null(inFile1))
      return(NULL)
    dat<-read.xlsx(inFile1$datapath, sheetName="MapleInputFile",  rowIndex = NULL, header=TRUE)
    return(dat)
  })
  
  data2 <-eventReactive(input$Compute2, { 
    inFile2 <- input$file2
    if (is.null(inFile2))
      return(NULL)
    dat<-read.xlsx(inFile2$datapath,sheetName="MapleInputFile", rowIndex = NULL, header=TRUE)
    return(dat)
  })
  
  data3 <-eventReactive(input$Compute3, { 
    inFile3 <- input$file3 
    if (is.null(inFile3))
      return(NULL)
    dat<-read.xlsx(inFile3$datapath,sheetName="MapleInputFile",  rowIndex = NULL, header=TRUE)
    return(dat)
  })
  
  #  Dataframe for pressure data minus first point
  
  Radius1 <- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data30<-data1()
    Radius1<-data30[1:25,2]
    return(Radius1)
  })
  
  Radius2 <- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data31<-data1()
    Radius2<-data31[31:53,2]
    return(Radius2)
  })
  
  Radius3 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data32<-data2()
    Radius3<-data32[1:25,2]
    return(Radius3)
  })
  
  
  Radius4 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data33<-data2()
    Radius4<-data33[31:53,2]
    return(Radius4)
  })
  
  Radius5 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data34<-data3()
    Radius5<-data34[1:25,2]
    return(Radius5)
  })
  
  Radius6 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data35<-data3()
    Radius6<-data35[31:53,2]
    return(Radius6)
  })
  
  Volume1<- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data36<-data1()
    Volume1<-data36[1:25,9]
    return(Volume1)
  })
  
  Volume2<- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data37<-data1()
    Volume2<-data37[31:53,9]
    return(Volume2)
  })
  
  Volume3 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data38<-data2()
    Volume3<-data38[1:25,9]
    return(Volume3)
  })
  
  Volume4 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data39<-data2()
    Volume4<-data39[31:53,9]
    return(Volume4)
  })
  
  
  Volume5 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data40<-data3()
    Volume5<-data40[1:25,9]
    return(Volume5)
  })
  
  Volume6 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data41<-data3()
    Volume6<-data41[31:53,9]
    return(Volume6)
  })
  
  
  Pressure1 <- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data4<-data1()
    Pressure1<-data4[1:25,3]
    return(Pressure1)
  })
  
  Pressure2 <- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data5<-data1()
    Pressure2<-data5[29:53,3]
    return(Pressure2)
  })
  
  Pressure3 <- eventReactive(input$Compute1, {
    # This gets called whenever the app is reloaded
    data6<-data1()
    Pressure3<-data6[57:77,3]
    return(Pressure3)
  })
  
  Pressure4 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data7<-data2()
    Pressure4<-data7[1:25,3]
    return(Pressure4)
  })
  
  Pressure5 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data8<-data2()
    Pressure5<-data8[29:53,3]
    return(Pressure5)
  })
  
  Pressure6 <- eventReactive(input$Compute2, {
    # This gets called whenever the app is reloaded
    data9<-data2()
    Pressure6<-data9[57:77,3]
    return(Pressure6)
  })
  
  Pressure7 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data10<-data3()
    Pressure7<-data10[1:25,3]
    return(Pressure7)
  })
  
  Pressure8 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data11<-data1()
    Pressure8<-data11[29:53,3]
    return(Pressure8)
  })
  
  Pressure9 <- eventReactive(input$Compute3, {
    # This gets called whenever the app is reloaded
    data12<-data1()
    Pressure9<-data12[57:77,3]
    return(Pressure9)
  })
  
  
  
  # Dataframe for saturation 
  
  
  
  
  Saturation1 <- eventReactive(input$Compute1,{
    
    # This gets called whenever the app is reloaded
    data13<-data1()
    Saturation1<-data13[1:25,5]/100
    return(Saturation1)
  })  
  
  Saturation2 <- eventReactive(input$Compute1,{
    
    # This gets called whenever the app is reloaded
    data14<-data1()
    Saturation2<-data14[29:53,5]/100
    return(Saturation2)
  })  
  
  Saturation3<- eventReactive(input$Compute1,{
    
    # This gets called whenever the app is reloaded
    data15<-data1()
    Saturation3<-data15[55:77,5]/100
    return(Saturation3)
  })  
  
  Saturation4 <- eventReactive(input$Compute2,{
    
    # This gets called whenever the app is reloaded
    data16<-data2()
    Saturation4<-data16[1:25,5]/100
    return(Saturation4)
  })  
  
  Saturation5 <- eventReactive(input$Compute2,{
    
    # This gets called whenever the app is reloaded
    data17<-data2()
    Saturation5<-data17[29:53,5]/100
    return(Saturation5)
  })  
  
  Saturation6<- eventReactive(input$Compute2,{
    
    # This gets called whenever the app is reloaded
    data18<-data2()
    Saturation6<-data18[55:77,5]/100
    return(Saturation6)
  }) 
  
  Saturation7 <- eventReactive(input$Compute3,{
    
    # This gets called whenever the app is reloaded
    data19<-data3()
    Saturation7<-data19[1:25,5]/100
    return(Saturation7)
  })  
  
  Saturation8 <- eventReactive(input$Compute3,{
    
    # This gets called whenever the app is reloaded
    data20<-data3()
    Saturation8<-data20[29:53,5]/100
    return(Saturation8)
  })  
  
  Saturation9<- eventReactive(input$Compute3,{
    
    # This gets called whenever the app is reloaded
    data21<-data3()
    Saturation9<-data21[55:77,5]/100
    return(Saturation9)
  }) 
  
  
  
  ExperimentalArea1 <- eventReactive(input$Compute1, {
    
    Wdry<-input$Weight1
    
    if (input$Curves4=="1st Acquisition"){
      S1=Saturation1()[which(Saturation1()!=0)]
      P1=Pressure1()[which(Saturation1()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
    } else if ( input$Curves4=="Drainage") {
      S1=Saturation2()[which(Saturation2()!=0)]
      P1=Pressure2()[which(Saturation2()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
    } else if (input$Curves4=="2nd Acquisition"){
      S1=Saturation3()[which(Saturation3()!=0)]
      P1=Pressure3()[which(Saturation3()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
      
    }
    # calculating area
    if (is.null(ExpArea)) {
      ExpArea1<-NULL
    } else {
      ExpArea1<-sum(ExpArea[which(ExpArea!=0)])
    }
    return(list(ExpArea=ExpArea,ExpArea1=ExpArea1))
  })
  
  
  output$CWP1 <- renderPrint({
    CWP1 <- ExperimentalArea1()$ExpArea1
    if (!is.null(CWP1)) {
      
      return(ExperimentalArea1()$ExpArea1)    }
  })
  
  EffectiveCWP1 <- eventReactive(input$Compute1, {
    
    effectcwp=(ExperimentalArea1()$ExpArea1/((input$Num15)*(input$Num16)))
    
    if (is.null(effectcwp)) {
      effectcwp<-NULL
    } else {
      effectcwp<-(ExperimentalArea1()$ExpArea1/((input$Num15)*(input$Num16)))
    }
    return(effectcwp)
    
  })
  
  output$CWP2 <- renderPrint({
    CWP2 <- EffectiveCWP1()
    if (!is.null(CWP2)) {
      
      return(EffectiveCWP1()) 
      
    }
  })
  
  
  ExperimentalArea2 <- eventReactive(input$Compute2, {
    
    Wdry<-input$Weight2
    
    if (input$Curves5=="1st Acquisition"){
      S1=Saturation4()[which(Saturation4()!=0)]
      P1=Pressure4()[which(Saturation4()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
    } else if ( input$Curves5=="Drainage") {
      S1=Saturation5()[which(Saturation5()!=0)]
      P1=Pressure5()[which(Saturation5()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
    } else if (input$Curves5=="2nd Acquisition"){
      S1=Saturation6()[which(Saturation6()!=0)]
      P1=Pressure6()[which(Saturation6()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
      
    }
    # calculating area
    if (is.null(ExpArea)) {
      ExpArea2<-NULL
    } else {
      ExpArea2<-sum(ExpArea[which(ExpArea!=0)])
    }
    return(list(ExpArea=ExpArea,ExpArea2=ExpArea2))
  })
  
  
  output$CWP3 <- renderPrint({
    CWP3 <- ExperimentalArea2()$ExpArea2
    if (!is.null(CWP3)) {
      
      return(ExperimentalArea2()$ExpArea2)    }
  })
  
  
  EffectiveCWP2 <- eventReactive(input$Compute2, {
    
    effectcwp=(ExperimentalArea2()$ExpArea2/((input$Num21)*(input$Num22)))
    
    if (is.null(effectcwp)) {
      effectcwp<-NULL
    } else {
      effectcwp<-(ExperimentalArea2()$ExpArea2/((input$Num21)*(input$Num22)))
    }
    return(effectcwp)
    
  })
  
  output$CWP4 <- renderPrint({
    CWP4 <- EffectiveCWP2()
    if (!is.null(CWP4)) {
      
      return(EffectiveCWP2()) 
      
    }
  })
  
  
  
  ExperimentalArea3 <- eventReactive(input$Compute3, {
    
    Wdry<-input$Weight3
    
    if (input$Curves6=="1st Acquisition"){
      S1=Saturation7()[which(Saturation7()!=0)]
      P1=Pressure7()[which(Saturation7()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
    } else if ( input$Curves6=="Drainage") {
      S1=Saturation8()[which(Saturation8()!=0)]
      P1=Pressure8()[which(Saturation8()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
    } else if (input$Curves6=="2nd Acquisition"){
      S1=Saturation9()[which(Saturation9()!=0)]
      P1=Pressure9()[which(Saturation9()!=0)]
      ExpArea=rep(0, length(S1))
      for (k in 1:length(S1)) {
        ExpArea[k]=(S1[k+1]-S1[k])*5.950*(P1[k]+P1[k+1])*(0.0987)*Wdry/(2*30.25)
      }
      
      
    }
    # calculating area
    if (is.null(ExpArea)) {
      ExpArea3<-NULL
    } else {
      ExpArea3<-sum(ExpArea[which(ExpArea!=0)])
    }
    return(list(ExpArea=ExpArea,ExpArea3=ExpArea3))
  })
  
  
  output$CWP5 <- renderPrint({
    CWP5 <- ExperimentalArea3()$ExpArea3
    if (!is.null(CWP5)) {
      
      return(ExperimentalArea3()$ExpArea3)    }
  })
  
  EffectiveCWP3 <- eventReactive(input$Compute3, {
    
    effectcwp=(ExperimentalArea3()$ExpArea3/((input$Num39)*(input$Num40)))
    
    if (is.null(effectcwp)) {
      effectcwp<-NULL
    } else {
      effectcwp<-(ExperimentalArea3()$ExpArea3/((input$Num39)*(input$Num40)))
    }
    return(effectcwp)
    
  })
  
  output$CWP6 <- renderPrint({
    CWP6 <- EffectiveCWP3()
    if (!is.null(CWP6)) {
      
      return(EffectiveCWP3()) 
      
    }
  })
  
  
  output$plot4<- renderPlot({
    
    
    if (input$checkGroup1=="1"){
      s3<-Saturation1()
      p3<-Pressure1()
      s4<-Saturation2()
      p4<-Pressure2()
      plot(s3[],p3[], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s3[],p3[],col="red",lwd=2)
      lines(s4[],p4[],col="blue",lwd=2)
      
    }else if (input$checkGroup1=="2"){
      s5<-Saturation4()
      p5<-Pressure4()
      s6<-Saturation5()
      p6<-Pressure5() 
      plot(s5[],p5[], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s5[],p5[],col="red",lwd=2)
      lines(s6[],p6[],col="blue",lwd=2)
      
    }else if (input$checkGroup1=="3"){
      p6<-Pressure5() 
      s7<-Saturation7()
      p7<-Pressure7()
      s8<-Saturation8()
      p8<-Pressure8() 
      plot(s7[],p7[], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s7[],p7[],col="red",lwd=2)
      lines(s8[],p8[],col="blue",lwd=2)
      
    } else if (input$checkGroup1=="4"){
      s3<-Saturation1()
      p3<-Pressure1()
      s4<-Saturation2()
      p4<-Pressure2()
      s5<-Saturation4()
      p5<-Pressure4()
      s6<-Saturation5()
      p6<-Pressure5() 
      plot(s5[],p5[], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s3[],p3[],col="red",lwd=2)
      lines(s4[],p4[],col="blue",lwd=2)
      lines(s5[],p5[],col="red",lwd=2)
      lines(s6[],p6[],col="blue",lwd=2)
      
    }else if (input$checkGroup1=="5"){
      s3<-Saturation1()
      p3<-Pressure1()
      s4<-Saturation2()
      p4<-Pressure2()
      s5<-Saturation4()
      p5<-Pressure4()
      s6<-Saturation5()
      p6<-Pressure5() 
      p6<-Pressure5() 
      s7<-Saturation7()
      p7<-Pressure7()
      s8<-Saturation8()
      p8<-Pressure8() 
      plot(s5[],p5[], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s3[],p3[],col="red",lwd=2)
      lines(s4[],p4[],col="blue",lwd=2)
      lines(s5[],p5[],col="red",lwd=2)
      lines(s6[],p6[],col="blue",lwd=2)
      lines(s7[],p7[],col="red",lwd=2)
      lines(s8[],p8[],col="blue",lwd=2)
    }
    
  })
  
  output$plot5<- renderPlot({
    
    
    if (input$checkGroup2=="1"){
      s3<-Volume1()
      p3<-Radius1()
      s4<-Volume2()
      p4<-Radius2()
      plot(p3[],s3[], main = "Pore Volume Distribution", xlab = "Radius, um",ylab = "Pore Volume, mm3/um.g",xlim=c(0,300), ylim =c(0,400))
      lines(p3[],s3[],col="red",lwd=2)
      lines(p4[],s4[],col="blue",lwd=2)
      
    }else if (input$checkGroup2=="2"){
      s5<-Volume3()
      p5<-Radius3()
      s6<-Volume4()
      p6<-Radius4() 
      plot(p5[],s5[], main = "Pore Volume Distribution", xlab = "Radius, um",ylab = "Pore Volume, mm3/um.g",xlim=c(0,300), ylim =c(0,400))
      lines(p5[],s5[],col="red",lwd=2)
      lines(p6[],s6[],col="blue",lwd=2)
      
    }else if (input$checkGroup2=="3"){
      s7<-Volume5()
      p7<-Radius5()
      s8<-Volume6()
      p8<-Radius6() 
      plot(p7[],s7[], main = "Pore Volume Distribution", xlab = "Radius, um",ylab = "Pore Volume, mm3/um.g",xlim=c(0,300), ylim =c(0,400))
      lines(p7[],s7[],col="red",lwd=2)
      lines(p8[],s8[],col="blue",lwd=2)
      
    }else if (input$checkGroup2=="4"){
      s3<-Volume1()
      p3<-Radius1()
      s4<-Volume2()
      p4<-Radius2()
      s5<-Volume3()
      p5<-Radius3()
      s6<-Volume4()
      p6<-Radius4() 
      plot(p5[],s5[], main = "Pore Volume Distribution", xlab = "Radius, um",ylab = "Pore Volume, mm3/um.g",xlim=c(0,300), ylim =c(0,400))
      lines(p3[],s3[],col="red",lwd=2)
      lines(p4[],s4[],col="blue",lwd=2)
      lines(p5[],s5[],col="red",lwd=2)
      lines(p6[],s6[],col="blue",lwd=2)
      
    }else if (input$checkGroup2=="5"){
      s3<-Volume1()
      p3<-Radius1()
      s4<-Volume2()
      p4<-Radius2()
      s5<-Volume3()
      p5<-Radius3()
      s6<-Volume4()
      p6<-Radius4() 
      s7<-Volume5()
      p7<-Radius5()
      s8<-Volume6()
      p8<-Radius6() 
      plot(p5[],s5[], main = "Pore Volume Distribution", xlab = "Radius, um",ylab = "Pore Volume, mm3/um.g",xlim=c(0,300), ylim =c(0,400))
      lines(p3[],s3[],col="red",lwd=2)
      lines(p4[],s4[],col="blue",lwd=2)
      lines(p5[],s5[],col="red",lwd=2)
      lines(p6[],s6[],col="blue",lwd=2)
      lines(p7[],s7[],col="red",lwd=2)
      lines(p8[],s8[],col="blue",lwd=2)
      
    }
  })
  
  output$plot6<- renderPlot({
    
    if (input$checkGroup3=="1"){
      s4<-Saturation2() #desorption data of upper layer
      s5<-Saturation4() # absorption data of lower layer
      plot(s4[],s4[], main = "Partion Tendency Curve", xlab = "Absorption Saturation",ylab = "Desorption Saturation",xlim=c(0,1))
      lines(s4[],s4[],col="red",lwd=2)
      lines(s4[24:1],s5[1:24],col="blue",lwd=2)
      
      
    }else if (input$checkGroup3=="2"){
      s6<-Saturation5() #desorption data of upper layer (second layer)
      s7<-Saturation7() # absorption data of lower layer (storage layer)
      plot(s6[],s6[], main = "Partion Tendency Curve", xlab = "Absorption Saturation",ylab = "Desorption Saturation",xlim=c(0,1))
      lines(s6[],s6[],col="red",lwd=2)
      lines(s6[24:1],s7[1:24],col="green",lwd=2)
      
    }else if (input$checkGroup3=="3"){
      s4<-Saturation2() #desorption data of upper layer
      s5<-Saturation4() # absorption data of lower layer
      s6<-Saturation5() #desorption data of upper layer (second layer)
      s7<-Saturation7() # absorption data of lower layer (storage layer)
      plot(s6[],s6[], main = "Partion Tendency Curve", xlab = "Absorption Saturation",ylab = "Desorption Saturation",xlim=c(0,1))
      lines(s4[],s4[],col="red",lwd=2)
      lines(s4[24:1],s5[1:24],col="blue",lwd=2)
      lines(s6[],s6[],col="red",lwd=2)
      lines(s6[24:1],s7[1:24],col="green",lwd=2)
    }
    
  })
  
  output$plot7<- renderPlot({
    
    if (input$checkGroup4=="1"){
      s3<-Saturation1() #absorption data of Top layer
      s4<-Saturation2() #absorption data of Top layer
      plot(s3[],s3[], main = "Spreading Curve", xlab = "Desorption Saturation",ylab = "Absorption Saturation",xlim=c(0,1), ylim =c(0,1))
      lines(s3[],s3[],col="black",lwd=2)
      lines(s4[24:1],s3[1:24],col="red",lwd=2)
      
    }else if (input$checkGroup4=="2"){
      s5<-Saturation4() #absorption data of Second layer
      s6<-Saturation5() #desorption data of Second layer
      plot(s5[],s5[], main = "Spreading Curve", xlab = "Desorption Saturation",ylab = "Absorption Saturation",xlim=c(0,1), ylim =c(0,1))
      lines(s5[],s5[],col="black",lwd=2)
      lines(s6[24:1],s5[1:24],col="blue",lwd=2)
      
    }else if (input$checkGroup4=="3"){
      s7<-Saturation7() #absorption data of Storage layer
      s8<-Saturation8() #desorption data of Storage layer
      plot(s7[],s7[], main = "Spreading Curve", xlab = "Desorption Saturation",ylab = "Absorption Saturation",xlim=c(0,1), ylim =c(0,1))
      lines(s7[],s7[],col="black",lwd=2)
      lines(s8[24:1],s7[1:24],col="green",lwd=2)
      
    }else if (input$checkGroup4=="4"){
      s3<-Saturation1() #absorption data of Top layer
      s4<-Saturation2() #absorption data of Top layer
      s5<-Saturation4() #absorption data of Second layer
      s6<-Saturation5() #desorption data of Second layer
      plot(s5[],s5[], main = "Spreading Curve", xlab = "Desorption Saturation",ylab = "Absorption Saturation",xlim=c(0,1), ylim =c(0,1))
      lines(s3[],s3[],col="black",lwd=2)
      lines(s4[24:1],s3[1:24],col="red",lwd=2)
      lines(s5[],s5[],col="black",lwd=2)
      lines(s6[24:1],s5[1:24],col="blue",lwd=2)
      
    }else if (input$checkGroup4=="5"){
      s3<-Saturation1() #absorption data of Top layer
      s4<-Saturation2() #absorption data of Top layer
      s5<-Saturation4() #absorption data of Second layer
      s6<-Saturation5() #desorption data of Second layer
      s7<-Saturation7() #absorption data of Storage layer
      s8<-Saturation8() #desorption data of Storage layer
      plot(s5[],s5[], main = "Spreading Curve", xlab = "Desorption Saturation",ylab = "Absorption Saturation",xlim=c(0,1), ylim =c(0,1))
      lines(s3[],s3[],col="black",lwd=2)
      lines(s4[24:1],s3[1:24],col="red",lwd=2)
      lines(s5[],s5[],col="black",lwd=2)
      lines(s6[24:1],s5[1:24],col="blue",lwd=2)
      lines(s7[],s7[],col="black",lwd=2)
      lines(s8[24:1],s7[1:24],col="green",lwd=2)
    }
  })
  
  
  # Sorting out best points for succesful curve fit
  
  PSfit <- eventReactive(input$Plot1,{
    
    if (input$Curves1=="1st Acquisition"){
      
      P1=Pressure1()
      S1=Saturation1()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-1000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
        Sfit=c3[which(c3>input$num176&c3<input$num177)]  # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
        Pfit=c2[which(c3>input$num176&c3<input$num177)]
        
      }
      
    } else if ( input$Curves1=="Drainage") {
      
      P1=Pressure2()
      S1=Saturation2()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-5000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
        Sfit=c3[which(c3>input$num176&c3<input$num177)]  # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
        Pfit=c2[which(c3>input$num176&c3<input$num177)]
        
      }
      
      
    }else if (input$Curves1=="2nd Acquisition"){
      
      P1=Pressure3()
      S1=Saturation3()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-1000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
      }
      
      Sfit=c3[which(c3>input$num176&c3<input$num177)]    # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
      Pfit=c2[which(c3>input$num176&c3<input$num177)]
      
      
    }
    
    
    return (list(Sfit,Pfit))
    
  })  
  
  output$plot8<- renderPlot({
    
    # Variables for input slider values
    
    Po <- input$Sl1
    m <- input$Sl2
    n <-input$Sl3
    s1<-data.frame(PSfit()[1])
    p1<-data.frame(PSfit()[2])
    
    if (input$Curves1=="1st Acquisition"){
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    } else if ( input$Curves1=="Drainage") {
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    } else if (input$Curves1=="2nd Acquisition"){
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    }
    
    
  })
  
  
  PSfit2 <- eventReactive(input$Plot2,{
    
    if (input$Curves2=="1st Acquisition"){
      
      P1=Pressure4()
      S1=Saturation4()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-1000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
        Sfit=c3[which(c3>input$num178&c3<input$num179)]  # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
        Pfit=c2[which(c3>input$num178&c3<input$num179)]
        
      }
      
    } else if ( input$Curves2=="Drainage") {
      
      P1=Pressure5()
      S1=Saturation5()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-5000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
        Sfit=c3[which(c3>input$num178&c3<input$num179)]  # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
        Pfit=c2[which(c3>input$num178&c3<input$num179)]
        
      }
      
      
    }else if (input$Curves2=="2nd Acquisition"){
      
      P1=Pressure6()
      S1=Saturation6()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-1000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
      }
      
      Sfit=c3[which(c3>input$num178&c3<input$num179)]    # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
      Pfit=c2[which(c3>input$num178&c3<input$num179)]
      
      
    }
    
    
    return (list(Sfit,Pfit))
    
  })  
  
  
  
  output$plot10<- renderPlot({
    
    # Variables for input slider values
    
    Po <- input$Sl6
    m <- input$Sl7
    n <-input$Sl8
    s1<-data.frame(PSfit2()[1])
    p1<-data.frame(PSfit2()[2])
    
    if (input$Curves2=="1st Acquisition"){
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    } else if ( input$Curves2=="Drainage") {
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    } else if (input$Curves2=="2nd Acquisition"){
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    }
    
  })
  
  
  PSfit3 <- eventReactive(input$Plot3,{
    
    if (input$Curves3=="1st Acquisition"){
      
      P1=Pressure7()
      S1=Saturation7()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-1000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
        Sfit=c3[which(c3>input$num180&c3<input$num181)]  # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
        Pfit=c2[which(c3>input$num180&c3<input$num181)]
        
      }
      
    } else if ( input$Curves3=="Drainage") {
      
      P1=Pressure8()
      S1=Saturation8()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-5000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
        Sfit=c3[which(c3>input$num180&c3<input$num181)]  # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
        Pfit=c2[which(c3>input$num180&c3<input$num181)]
        
      }
      
      
    }else if (input$Curves3=="2nd Acquisition"){
      
      P1=Pressure9()
      S1=Saturation9()
      slope=rep(0, len = (length(P1)-1))
      c2=rep(0, len = (length(P1)))
      c3=rep(0, len = (length(S1)))
      Sfit=rep(0, len = (length(P1)))
      Pfit=rep(0, len = (length(P1)))
      
      for (i in 1:(length(P1)-1)){
        
        slope[i]=(P1[i+1]-P1[i])/(S1[i+1]-S1[i])
        
        if (slope[i]>-1000 & 0>slope[i]){
          c2[i]=P1[i]
          c3[i]=S1[i]
        } else {
          slope[i]=0
        }
        
      }
      
      Sfit=c3[which(c3>input$num180&c3<input$num181)]    # choose pressure points which are corresponding to that particular saturation points. c3 in both curves.
      Pfit=c2[which(c3>input$num180&c3<input$num181)]
      
      
    }
    
    
    return (list(Sfit,Pfit))
    
  })    
  
  
  
  
  
  
  output$plot12<- renderPlot({
    
    # Variables for input slider values
    
    Po <- input$Sl11
    m <- input$Sl12
    n <-input$Sl13
    s1<-data.frame(PSfit3()[1])
    p1<-data.frame(PSfit3()[2])
    
    if (input$Curves3=="1st Acquisition"){
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    } else if ( input$Curves3=="Drainage") {
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    } else if (input$Curves3=="2nd Acquisition"){
      yfit1 <- Po*(((s1[,1])^(-1/m)-1)^(1/n))
      plot(s1[,1],p1[,1], main = "Pressure vs Satuartion", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
      lines(s1[,1],yfit1,col="red",lwd=2)
    }
  })
  
  #regression
  
  regression1 <- eventReactive(input$Fit1, {
    Po <- input$Sl1
    m <- input$Sl2
    n <-input$Sl3
    s3<-PSfit()[1]
    p3<-PSfit()[2]
    s2<-data.frame(s3)
    p2<-data.frame(p3)
    s1<-s2[,1]
    p1<-p2[,1]
    if (input$Curves1=="1st Acquisition"){
      fit1<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n), control = list(maxiter = 100000,minFactor=0.00001))
    } else if ( input$Curves1=="Drainage") { 
      fit1<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n),control = list(maxiter = 100000,minFactor=0.00001))
    } else if (input$Curves1=="2nd Acquisition"){
      fit1<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n),control = list(maxiter = 100000, minFactor=0.00001))
    }
    # Get the model summary
    if (is.null(fit1)) {
      fit.values1<-NULL
      summary1a <- NULL
      cf1<-NULL
    } else {
      fit.values1<-fitted(fit1)
      summary1a <- summary(fit1)
      cf1<-coef(fit1)}
    
    # get the model data
    return(list(fit.values1=fit.values1,summary1a=summary1a,cf1=cf1))
  })
  
  values2<-reactive({
    values1<-regression1()$fit.values1
    return(values1)
  })
  
  cf2 <- reactive({
    cf1<-regression1()$cf1
    return(cf1)
  })
  
  output$summary1 <- renderPrint({
    summary1a <- regression1()$summary1a
    if (!is.null(summary1a)) {
      return(regression1()$summary1a)
    }
    
  })
  
  VGFitArea <- eventReactive(input$Fit1, {
    
    Wdry<-input$Weight1
    
    if (input$Curves7=="1st Acquisition"){
      S1=seq(0.001,0.99,1/26)
      Pc7<-rep(1, length(S1))
      for ( i in 1:26) {
        Pc7[i]<-cf2()[1]*(((S1[i])^-(1/cf2()[2])-1)^(1/cf2()[3]))
      }
      VGfitArea=rep(1, len=25)
      for (k in 1:25) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc7[k]+Pc7[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    } else if ( input$Curves7=="Drainage") {
      
      S1=seq(0.001,0.99,1/27)
      Pc8<-rep(1, length(S1))
      for ( i in 1:27) {
        Pc8[i]<-cf2()[1]*(((S1[i])^-(1/cf2()[2])-1)^(1/cf2()[3]))
      }
      VGfitArea=rep(1, len=26)
      for (k in 1:26) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc8[k]+Pc8[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    } else if (input$Curves7=="2nd Acquisition"){
      
      S1=seq(0.001,0.99,1/25)
      Pc9<-rep(1, length(S1))
      for ( i in 1:25) {
        Pc9[i]<-cf2()[1]*(((S1[i])^-(1/cf2()[2])-1)^(1/cf2()[3]))
      }
      VGfitArea=rep(1, len=24)
      for (k in 1:24) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc9[k]+Pc9[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    }
    
    # -----------------------------------------------------------------------------------------------------------------------------------------------
    
    
    # calculating area
    if (is.null(VGfitArea)) {
      VGfitArea1<-NULL
    } else {
      VGfitArea1<-sum(VGfitArea)
    }
    return(list(VGfitArea=VGfitArea,VGfitArea1=VGfitArea1))
  })
  
  
  output$Num69 <- renderPrint({
    
    Num69 <- VGFitArea()$VGfitArea1
    if (!is.null(Num69)) {
      return(VGFitArea()$VGfitArea1)
    }
    
  })
  
  
  regression2 <- eventReactive(input$Fit2, {
    Po <- input$Sl6
    m <- input$Sl7
    n <-input$Sl8
    s3<-PSfit2()[1]
    p3<-PSfit2()[2]
    s2<-data.frame(s3)
    p2<-data.frame(p3)
    s1<-s2[,1]
    p1<-p2[,1]
    if (input$Curves2=="1st Acquisition"){
      fit2<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n), control = list(maxiter = 100000,minFactor=0.00001))
    } else if ( input$Curves2=="Drainage") { 
      fit2<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n),control = list(maxiter = 100000,minFactor=0.00001))
    } else if (input$Curves2=="2nd Acquisition"){
      fit2<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n),control = list(maxiter = 100000, minFactor=0.00001))
    }
    # Get the model summary
    if (is.null(fit2)) {
      fit.values3<-NULL
      summary2a <- NULL
      cf3<-NULL
    } else {
      fit.values3<-fitted(fit2)
      summary2a <- summary(fit2)
      cf3<-coef(fit2)}
    
    # get the model data
    return(list(fit.values3=fit.values3,summary2a=summary2a,cf3=cf3))
  })
  values4<-reactive({
    values3<-regression2()$fit.values3
    return(values3)
  })
  cf4 <- reactive({
    cf3<-regression2()$cf3
    return(cf3)
  })
  
  output$summary2 <- renderPrint({
    summary2a <- regression2()$summary2a
    if (!is.null(summary2a)) {
      return(regression2()$summary2a)
    }
    
  })
  
  VGFitArea2 <- eventReactive(input$Fit2, {
    
    Wdry<-input$Weight2
    
    if (input$Curves8=="1st Acquisition"){
      S1=seq(0.001,0.99,1/26)
      Pc7<-rep(1, length(S1))
      for ( i in 1:26) {
        Pc7[i]<-cf4()[1]*(((S1[i])^-(1/cf4()[2])-1)^(1/cf4()[3]))
      }
      VGfitArea=rep(1, len=25)
      for (k in 1:25) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc7[k]+Pc7[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    } else if ( input$Curves8=="Drainage") {
      
      S1=seq(0.001,0.99,1/27)
      Pc8<-rep(1, length(S1))
      for ( i in 1:27) {
        Pc8[i]<-cf4()[1]*(((S1[i])^-(1/cf4()[2])-1)^(1/cf4()[3]))
      }
      VGfitArea=rep(1, len=26)
      for (k in 1:26) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc8[k]+Pc8[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    } else if (input$Curves8=="2nd Acquisition"){
      
      S1=seq(0.001,0.99,1/25)
      Pc9<-rep(1, length(S1))
      for ( i in 1:25) {
        Pc9[i]<-cf4()[1]*(((S1[i])^-(1/cf4()[2])-1)^(1/cf4()[3]))
      }
      VGfitArea=rep(1, len=24)
      for (k in 1:24) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc9[k]+Pc9[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    }
    
    # -----------------------------------------------------------------------------------------------------------------------------------------------
    
    
    # calculating area
    if (is.null(VGfitArea)) {
      VGfitArea1<-NULL
    } else {
      VGfitArea1<-sum(VGfitArea)
    }
    return(list(VGfitArea=VGfitArea,VGfitArea1=VGfitArea1))
  })
  
  
  output$Num108 <- renderPrint({
    
    Num108 <- VGFitArea2()$VGfitArea1
    if (!is.null(Num108)) {
      return(VGFitArea2()$VGfitArea1)
    }
    
  })
  
  
  regression3 <- eventReactive(input$Fit3, {
    Po <- input$Sl11
    m <- input$Sl12
    n <-input$Sl13
    s3<-PSfit3()[1]
    p3<-PSfit3()[2]
    s2<-data.frame(s3)
    p2<-data.frame(p3)
    s1<-s2[,1]
    p1<-p2[,1]
    if (input$Curves3=="1st Acquisition"){
      fit3<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n), control = list(maxiter = 100000,minFactor=0.00001))
    } else if ( input$Curves3=="Drainage") { 
      fit3<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n),control = list(maxiter = 100000,minFactor=0.00001))
    } else if (input$Curves3=="2nd Acquisition"){
      fit3<-nls(p1 ~ Po*(((s1)^(-1/m)-1)^(1/n)), data=data1(), start=list(Po=Po,m=m,n=n),control = list(maxiter = 100000, minFactor=0.00001))
    }
    # Get the model summary
    if (is.null(fit3)) {
      fit.values5<-NULL
      summary3a <- NULL
      cf5<-NULL
    } else {
      fit.values5<-fitted(fit3)
      summary3a <- summary(fit3)
      cf5<-coef(fit3)}
    
    # get the model data
    return(list(fit.values5=fit.values5,summary3a=summary3a,cf5=cf5))
  })
  values6<-reactive({
    values5<-regression3()$fit.values5
    return(values5)
  })
  cf6 <- reactive({
    cf5<-regression3()$cf5
    return(cf5)
  })
  
  output$summary3 <- renderPrint({
    summary3a <- regression3()$summary3a
    if (!is.null(summary3a)) {
      return(regression3()$summary3a)
    }
    
  })
  
  
  VGFitArea3 <- eventReactive(input$Fit3, {
    
    Wdry<-input$Weight3
    
    if (input$Curves9=="1st Acquisition"){
      S1=seq(0.001,0.99,1/26)
      Pc7<-rep(1, length(S1))
      for ( i in 1:26) {
        Pc7[i]<-cf6()[1]*(((S1[i])^-(1/cf6()[2])-1)^(1/cf6()[3]))
      }
      VGfitArea=rep(1, len=25)
      for (k in 1:25) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc7[k]+Pc7[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    } else if ( input$Curves9=="Drainage") {
      
      S1=seq(0.001,0.99,1/27)
      Pc8<-rep(1, length(S1))
      for ( i in 1:27) {
        Pc8[i]<-cf6()[1]*(((S1[i])^-(1/cf6()[2])-1)^(1/cf6()[3]))
      }
      VGfitArea=rep(1, len=26)
      for (k in 1:26) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc8[k]+Pc8[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    } else if (input$Curves9=="2nd Acquisition"){
      
      S1=seq(0.001,0.99,1/25)
      Pc9<-rep(1, length(S1))
      for ( i in 1:25) {
        Pc9[i]<-cf6()[1]*(((S1[i])^-(1/cf6()[2])-1)^(1/cf6()[3]))
      }
      VGfitArea=rep(1, len=24)
      for (k in 1:24) {
        VGfitArea[k]=(S1[k+1]-S1[k])*5.950*(Pc9[k]+Pc9[k+1])*(0.0987)*Wdry/(2*30.25)
      }
    }
    
    # -----------------------------------------------------------------------------------------------------------------------------------------------
    
    
    # calculating area
    if (is.null(VGfitArea)) {
      VGfitArea1<-NULL
    } else {
      VGfitArea1<-sum(VGfitArea)
    }
    return(list(VGfitArea=VGfitArea,VGfitArea1=VGfitArea1))
  })
  
  
  output$Num146 <- renderPrint({
    
    Num146 <- VGFitArea3()$VGfitArea1
    if (!is.null(Num146)) {
      return(VGFitArea3()$VGfitArea1)
    }
    
  })
  
  output$plot9<-
    
    
    renderPlot({
      
      s3<-PSfit()[1]
      s2<-data.frame(s3)
      s1<-s2[,1]
      
      if (input$Curves1=="1st Acquisition"){
        
        plot(s1,values2(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)", xlim=c(0,1))
        
        polygon(x=c(s1[1],seq(s1[1],tail(s1,n=1),0.01),tail(s1,n=1)),y=c(0,cf2()[1]*(((seq(s1[1],tail(s1,n=1),0.01))^-(1/cf2()[2])-1)^(1/cf2()[3])),0), density=30,col = "orange", border = "red")
        
      } else if ( input$Curves1=="Drainage") {
        
        plot(s1,values2(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
        
        polygon(x=c(s1[1],seq(s1[1],tail(s1,n=1),-0.01),tail(s1,n=1)),y=c(0,cf2()[1]*(((seq(s1[1],tail(s1,n=1),-0.01))^-(1/cf2()[2])-1)^(1/cf2()[3])),0), density=30,col = "orange", border = "red")
        
      } else if (input$Curves1=="2nd Acquisition"){
        
        plot(s1,values2(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
        
        polygon(x=c(s1[1],seq(s1[1],tail(s1,n=1),0.01),tail(s1,n=1)),y=c(0,cf2()[1]*(((seq(s1[1],tail(s1,n=1),0.01))^-(1/cf2()[2])-1)^(1/cf2()[3])),0), density=30,col = "orange", border = "red")
      }
      
      
    }) 
  
  output$plot11<-
    
    
    renderPlot({
      
      s4<-PSfit2()[1]
      s5<-data.frame(s4)
      s6<-s5[,1]
      
      if (input$Curves2=="1st Acquisition"){
        
        plot(s6,values4(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)", xlim=c(0,1))
        
        polygon(x=c(s6[1],seq(s6[1],tail(s6,n=1),0.01),tail(s6,n=1)),y=c(0,cf4()[1]*(((seq(s6[1],tail(s6,n=1),0.01))^-(1/cf4()[2])-1)^(1/cf4()[3])),0), density=30,col = "orange", border = "red")
        
      } else if ( input$Curves2=="Drainage") {
        
        plot(s6,values4(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
        
        polygon(x=c(s6[1],seq(s6[1],tail(s6,n=1),-0.01),tail(s6,n=1)),y=c(0,cf4()[1]*(((seq(s6[1],tail(s6,n=1),-0.01))^-(1/cf4()[2])-1)^(1/cf4()[3])),0), density=30,col = "orange", border = "red")
        
      } else if (input$Curves2=="2nd Acquisition"){
        
        plot(s6,values4(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
        
        polygon(x=c(s6[1],seq(s6[1],tail(s6,n=1),0.01),tail(s6,n=1)),y=c(0,cf4()[1]*(((seq(s6[1],tail(s6,n=1),0.01))^-(1/cf4()[2])-1)^(1/cf4()[3])),0), density=30,col = "orange", border = "red")
      }
      
      
    }) 
  
  output$plot13<-
    
    
    renderPlot({
      
      s7<-PSfit3()[1]
      s8<-data.frame(s7)
      s9<-s8[,1]
      
      if (input$Curves3=="1st Acquisition"){
        
        plot(s9,values6(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)", xlim=c(0,1))
        
        polygon(x=c(s9[1],seq(s9[1],tail(s9,n=1),0.01),tail(s9,n=1)),y=c(0,cf6()[1]*(((seq(s9[1],tail(s9,n=1),0.01))^-(1/cf6()[2])-1)^(1/cf6()[3])),0), density=30,col = "orange", border = "red")
        
      } else if ( input$Curves3=="Drainage") {
        
        plot(s9,values6(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
        
        polygon(x=c(s9[1],seq(s9[1],tail(s9,n=1),-0.01),tail(s9,n=1)),y=c(0,cf6()[1]*(((seq(s9[1],tail(s9,n=1),-0.01))^-(1/cf6()[2])-1)^(1/cf6()[3])),0), density=30,col = "orange", border = "red")
        
      } else if (input$Curves3=="2nd Acquisition"){
        
        plot(s9,values6(), main = "Pressure vs Satuartion - VG Curve Fit", xlab = "Saturation",ylab = "Capillary Pressure (Pc)",xlim=c(0,1))
        
        polygon(x=c(s9[1],seq(s9[1],tail(s9,n=1),0.01),tail(s9,n=1)),y=c(0,cf6()[1]*(((seq(s9[1],tail(s9,n=1),0.01))^-(1/cf6()[2])-1)^(1/cf6()[3])),0), density=30,col = "orange", border = "red")
      }
      
      
    }) 
  
  
  
  
  output$Num59 <- renderPrint({
    Num59 <- cf2()[1]
    if (!is.null(Num59)) {
      return(cf2()[1]) 
    }
  })
  
  output$Num60 <- renderPrint({
    Num60  <- cf2()[2]
    if (!is.null(Num60 )) {
      return(cf2()[2]) 
    }
  })
  
  output$Num61  <- renderPrint({
    Num61  <- cf2()[3]
    if (!is.null(Num61)) {
      return(cf2()[3]) 
      
    }
  })
  
  output$Num98 <- renderPrint({
    Num98 <- cf4()[1]
    if (!is.null(Num98)) {
      return(cf4()[1]) 
    }
  })
  
  output$Num99 <- renderPrint({
    Num99  <- cf4()[2]
    if (!is.null(Num99)) {
      return(cf4()[2]) 
    }
  })
  
  output$Num100  <- renderPrint({
    Num100  <- cf4()[3]
    if (!is.null(Num100)) {
      return(cf4()[3]) 
      
    }
  })
  
  output$Num137 <- renderPrint({
    Num137 <- cf6()[1]
    if (!is.null(Num137)) {
      return(cf6()[1]) 
    }
  })
  
  output$Num138 <- renderPrint({
    Num138  <- cf6()[2]
    if (!is.null(Num138 )) {
      return(cf6()[2]) 
    }
  })
  
  output$Num139  <- renderPrint({
    Num139  <- cf6()[3]
    if (!is.null(Num139)) {
      return(cf6()[3]) 
      
    }
  })
  
  
}