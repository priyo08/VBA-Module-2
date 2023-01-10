Attribute VB_Name = "Module1"
Sub worksheets()

Dim Ws_Count As Integer
Dim i, j, k As Integer
Dim Open_val, Close_val As Double
Dim totalvol As Double
Dim Lastrow As Long
Dim high_tick, low_tick, great_tick As String
Dim high_tick_val, low_tick_val, great_tot_vol As Double

Ws_Count = ActiveWorkbook.worksheets.Count

For i = 1 To Ws_Count

    ThisWorkbook.worksheets(i).Cells(1, 9).Value = "Ticker"
    ThisWorkbook.worksheets(i).Cells(1, 10).Value = "Yearly_change"
    ThisWorkbook.worksheets(i).Cells(1, 11).Value = "Percent_change"
    ThisWorkbook.worksheets(i).Cells(1, 12).Value = "Total_Stock_Volume"
    ThisWorkbook.worksheets(i).Cells(1, 16).Value = "Ticker"
    ThisWorkbook.worksheets(i).Cells(1, 17).Value = "Value"
    ThisWorkbook.worksheets(i).Cells(2, 15).Value = "Greater % Increase"
    ThisWorkbook.worksheets(i).Cells(3, 15).Value = "Greater % Decrease"
    ThisWorkbook.worksheets(i).Cells(4, 15).Value = "Greater Total Volume"
    
    Lastrow = ThisWorkbook.worksheets(i).Cells(Rows.Count, 1).End(xlUp).Row
    
    Open_val = 0
    Close_val = 0
    totalvol = 0
    k = 2
    
    For j = 2 To Lastrow
    
        If j = 2 Then
            Open_val = ThisWorkbook.worksheets(i).Cells(j, 3).Value
            totalvol = totalvol + ThisWorkbook.worksheets(i).Cells(j, 7).Value
        Else
            If ThisWorkbook.worksheets(i).Cells(j, 1).Value = ThisWorkbook.worksheets(i).Cells(j - 1, 1).Value Then
                totalvol = totalvol + ThisWorkbook.worksheets(i).Cells(j, 7).Value
            Else
                ThisWorkbook.worksheets(i).Cells(k, 9).Value = ThisWorkbook.worksheets(i).Cells(j - 1, 1).Value
                Close_val = ThisWorkbook.worksheets(i).Cells(j - 1, 6).Value
                ThisWorkbook.worksheets(i).Cells(k, 10).Value = Close_val - Open_val
                ThisWorkbook.worksheets(i).Cells(k, 11).Value = Format(((Close_val - Open_val) / Open_val), "percent")
                ThisWorkbook.worksheets(i).Cells(k, 12).Value = totalvol
                
                totalvol = 0
                k = k + 1
                
                totalvol = totalvol + ThisWorkbook.worksheets(i).Cells(j, 7).Value
                Open_val = ThisWorkbook.worksheets(i).Cells(j, 3).Value
                                
            End If
            
        End If
        
    Next j
    
    Lastrow = ThisWorkbook.worksheets(i).Cells(Rows.Count, 9).End(xlUp).Row
    
    For j = 2 To Lastrow
    
        If ThisWorkbook.worksheets(i).Cells(j, 10).Value > 0 Then
            ThisWorkbook.worksheets(i).Cells(j, 10).Interior.ColorIndex = 4
        ElseIf ThisWorkbook.worksheets(i).Cells(j, 10).Value < 0 Then
            ThisWorkbook.worksheets(i).Cells(j, 10).Interior.ColorIndex = 3
        Else
            ThisWorkbook.worksheets(i).Cells(j, 10).Interior.ColorIndex = 6
        End If
        
        If ThisWorkbook.worksheets(i).Cells(j, 11).Value > 0 Then
            ThisWorkbook.worksheets(i).Cells(j, 11).Interior.ColorIndex = 4
        ElseIf ThisWorkbook.worksheets(i).Cells(j, 11).Value < 0 Then
            ThisWorkbook.worksheets(i).Cells(j, 11).Interior.ColorIndex = 3
        Else
            ThisWorkbook.worksheets(i).Cells(j, 11).Interior.ColorIndex = 6
        End If
        
        If j = 2 Then
            high_tick = ThisWorkbook.worksheets(i).Cells(j, 9).Value
            low_tick = ThisWorkbook.worksheets(i).Cells(j, 9).Value
            great_tick = ThisWorkbook.worksheets(i).Cells(j, 9).Value
            high_tick_val = ThisWorkbook.worksheets(i).Cells(j, 11).Value
            low_tick_val = ThisWorkbook.worksheets(i).Cells(j, 11).Value
            great_tot_vol = ThisWorkbook.worksheets(i).Cells(j, 12).Value
        Else
        
            If ThisWorkbook.worksheets(i).Cells(j, 11).Value > high_tick_val Then
                high_tick_val = ThisWorkbook.worksheets(i).Cells(j, 11).Value
                high_tick = ThisWorkbook.worksheets(i).Cells(j, 9).Value
            End If
            
            If ThisWorkbook.worksheets(i).Cells(j, 11).Value < low_tick_val Then
                low_tick_val = ThisWorkbook.worksheets(i).Cells(j, 11).Value
                low_tick = ThisWorkbook.worksheets(i).Cells(j, 9).Value
            End If
            
            If ThisWorkbook.worksheets(i).Cells(j, 12).Value > great_tot_vol Then
                great_tot_vol = ThisWorkbook.worksheets(i).Cells(j, 12).Value
                great_tick = ThisWorkbook.worksheets(i).Cells(j, 9).Value
            End If
            
        End If
       
    Next j
    
    ThisWorkbook.worksheets(i).Cells(2, 16).Value = high_tick
    ThisWorkbook.worksheets(i).Cells(2, 17).Value = Format(high_tick_val, "percent")
    
    ThisWorkbook.worksheets(i).Cells(3, 16).Value = low_tick
    ThisWorkbook.worksheets(i).Cells(3, 17).Value = Format(low_tick_val, "percent")
    
    ThisWorkbook.worksheets(i).Cells(4, 16).Value = great_tick
    ThisWorkbook.worksheets(i).Cells(4, 17).Value = great_tot_vol

Next i

End Sub
    

